import 'dart:io';
import 'dart:typed_data';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:hama_app/presentation/bloc/absen/absen_bloc.dart';
import 'package:hama_app/presentation/bloc/dailiy/daily_bloc.dart';
import 'package:hama_app/presentation/bloc/index_hama/index_hama_bloc.dart';
import 'package:hama_app/presentation/bloc/inspeksi/inspeksi_bloc.dart';
import 'package:hama_app/presentation/bloc/pemakaian/pemakaian_bloc.dart';
import 'package:hama_app/presentation/bloc/peralatan/peralatan_bloc.dart';
import 'package:hama_app/presentation/bloc/signature/signature_bloc.dart';
import 'package:hama_app/presentation/widget/widget_snackbar.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class ReportPage extends StatefulWidget {
  static const routeName = 'report-page';
  static const path = 'report-page';
  final String noOrder;
  const ReportPage({super.key, required this.noOrder});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final GlobalKey<SfSignaturePadState> signaturePadKey =
      GlobalKey<SfSignaturePadState>();
  TextEditingController nameClientController = TextEditingController();
  Uint8List? sign1;
  Uint8List? sign2;
  String? pihak1;
  DateTime? dateSelected;
  final List<String> listSearch = [
    'Daily Activity',
    'Indeks Populasi',
    'Inspeksi Hama',
    'Monitoring Pemakaian',
    'Monitoring Peralatan',
    'Time Sheet'
  ];
  String? searchCategories;

  @override
  void dispose() {
    nameClientController.dispose();
    super.dispose();
  }

  Future<void> selectedDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != dateSelected) {
      setState(() {
        dateSelected = picked;
      });
    }
  }

  Future<String> getFilePath(String url) async {
    Directory? directory;

    directory = await DownloadsPathProvider.downloadsDirectory;
    List<String> pathSegments = url.split('/');
    String fileName = pathSegments.last;
    String name = DateTime.now().microsecondsSinceEpoch.toString();
    final savePath = '${directory!.path}/$fileName$name.pdf';
    return savePath;
  }

  Future<void> generatePdf(String url) async {
    print('$baseUrl/$url');
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$url'),
      );

      if (response.statusCode == 200) {
        // Dapatkan direktori penyimpanan lokal
        final directory = await getApplicationDocumentsDirectory();

        // Tentukan path untuk menyimpan PDF di lokal
        List<String> pathSegments = url.split('/');
        String fileName = pathSegments.last;

        final filePath = '${directory.path}/$fileName';

        // Tulis data PDF ke file lokal
        final File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        final existingPdfBytes = file.readAsBytesSync();

        print('PDF berhasil diunduh ke: $filePath');

        final date = DateTime.now();
        // Buat dokumen PDF
        final PdfDocument document = PdfDocument(inputBytes: existingPdfBytes);
        document.pageSettings.orientation;
        // Tambahkan halaman ke dokumen
        final pageIndex = document.pages.count - 1;
        final PdfPage page = document.pages[pageIndex];

        // Tambahkan konten ke halaman
        final PdfGraphics graphics = page.graphics;
        // --------------------------------Disiapkan---------------------------

        final PdfBitmap signatureImage = PdfBitmap(sign1!);
        graphics.drawString(
          'Disiapkan Oleh,',
          PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(
            50,
            page.getClientSize().height - 180,
            page.getClientSize().width,
            20,
          ),
        );
        graphics.drawString(
          'Personel,',
          PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(
            50,
            page.getClientSize().height - 165,
            page.getClientSize().width,
            20,
          ),
        );

        page.graphics.drawImage(
          signatureImage,
          Rect.fromLTWH(
            10,
            page.getClientSize().height - 165,
            130,
            86.67,
          ),
        );
        graphics.drawString(
          '      $pihak1',
          PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(
            30,
            page.getClientSize().height - 75,
            page.getClientSize().width,
            20,
          ),
        );

//--------------------------------Menyetujui-----------------------------------------------
        final PdfBitmap signatureImage2 = PdfBitmap(sign2!);

        graphics.drawString(
            'Menyetujui,', PdfStandardFont(PdfFontFamily.helvetica, 12),
            bounds: Rect.fromLTWH(
                page.getClientSize().width - 120,
                page.getClientSize().height - 180,
                page.getClientSize().width,
                20));

        page.graphics.drawImage(
          signatureImage2,
          Rect.fromLTWH(
            page.getClientSize().width - 150,
            page.getClientSize().height - 165,
            130,
            86.67,
          ),
        );
        graphics.drawString(
          nameClientController.text,
          PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(
            // page.getClientSize().width - 10,
            page.getClientSize().width - 120,
            page.getClientSize().height - 75,
            page.getClientSize().width,
            20,
          ),
        );

        // Simpan dokumen PDF ke file
        final List<int> bytes = await document.save();
        final String filePatz = await getFilePath(url);

        await File(filePatz).writeAsBytes(bytes);
        OpenAppFile.open(filePatz);

        // Tutup dokumen PDF
        document.dispose();
      }
    } catch (e) {
      print('exception');
      throw Exception(e.toString());
    }
  }

  Future<void> selectedMonth() async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dateSelected) {
      setState(() {
        dateSelected = picked;
      });
    }
  }

  Future<void> saveSignature() async {
    ui.Image signatureData = await signaturePadKey.currentState!.toImage();
    ByteData? byteData =
        await signatureData.toByteData(format: ui.ImageByteFormat.png);
    sign2 = byteData!.buffer.asUint8List();

    // return signData;
  }

  @override
  void initState() {
    Future.microtask(
        () => context.read<SignatureBloc>().add(FetchGetAllSignature()));

    CacheUtil.getString(cacheUsername).then((value) {
      setState(() {
        pihak1 = value;
      });
    });
    super.initState();
  }

  bool validate() {
    if (pihak1 != null &&
        nameClientController.text.isNotEmpty &&
        sign1 != null &&
        sign2 != null &&
        dateSelected != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: const Text('Report All Form'),
      ),
      body: SingleChildScrollView(
        child: MultiBlocListener(
          listeners: [
            BlocListener<DailyBloc, DailyState>(
              listener: (context, state) {
                if (state is GenerateDailyPDFMonthlySuccess) {
                  print(state.generatePDFEntity.url);
                  generatePdf(state.generatePDFEntity.url);
                }
              },
            ),
            BlocListener<IndexHamaBloc, IndexHamaState>(
              listener: (context, state) {
                if (state is GenerateIndexPDFMonthlySuccess) {
                  generatePdf(state.generatePDFEntity.url);
                }
              },
            ),
            BlocListener<SignatureBloc, SignatureState>(
              listener: (context, state) {
                if (state is GetAllSignatureSuccess) {
                  if (state.listEntity.isNotEmpty) {
                    sign1 = Uint8List.fromList(state.listEntity[0].image);
                  }
                }
              },
            ),
            BlocListener<AbsenBloc, AbsenState>(
              listener: (context, state) {
                if (state is GenerateAbsenPDFMonthlySuccess) {
                  generatePdf(state.generatePDFEntity.url);
                }
              },
            ),
            BlocListener<PeralatanBloc, PeralatanState>(
              listener: (context, state) {
                if (state is GeneratePeralatanPDFMonthlySuccess) {
                  generatePdf(state.generatePDFEntity.url);
                }
              },
            ),
            BlocListener<PemakaianBloc, PemakaianState>(
              listener: (context, state) {
                if (state is GeneratePemakaianPDFMonthlySuccess) {
                  generatePdf(state.generatePDFEntity.url);
                }
              },
            ),
            BlocListener<InspeksiBloc, InspeksiState>(
              listener: (context, state) {
                if (state is GenerateInspeksiPDFMonthlySuccess) {
                  generatePdf(state.generatePDFEntity.url);
                }
              },
            ),
          ],
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 55.h,
                    width: 300.w,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        fillColor: whiteColor,
                        filled: true,
                        hintText: 'Pencarian',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.all(12.r),
                      ),
                      items: listSearch
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: ((value) {
                        final urut = listSearch.indexOf(value!);

                        setState(() {
                          searchCategories = listSearch[urut];
                        });
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 30.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(redColor)),
                          onPressed: () {
                            signaturePadKey.currentState!.clear();
                          },
                          child: const Text('Clear'))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 220.h,
                width: 1.sw,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: softGreyColor)),
                child: SizedBox(
                  height: 200.h,
                  width: 300.w,
                  child: SfSignaturePad(
                    key: signaturePadKey,
                    minimumStrokeWidth: 1,
                    maximumStrokeWidth: 3,
                    strokeColor: darkColor,
                    backgroundColor: transparentColor,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: nameClientController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'masukkan nama pelanggan',
                    fillColor: whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              )
                  .animate()
                  .fadeIn()
                  .scale()
                  .move(delay: 300.ms, duration: 600.ms),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  selectedMonth();
                },
                child: Container(
                  height: 55.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(width: 1, color: softGreyColor),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dateSelected != null
                              ? TextUtils().monthFormatInt(dateSelected)
                              : '',
                          style: greyTextStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: bold,
                          ),
                        ),
                        const Icon(Icons.date_range),
                      ],
                    ),
                  ),
                ),
              )
                  .animate()
                  .fadeIn()
                  .scale()
                  .move(delay: 300.ms, duration: 600.ms),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(greenColor)),
                        onPressed: () async {
                          await saveSignature();
                          if (validate()) {
                            final year = dateSelected!.year;
                            final month = dateSelected!.month;
                            if (searchCategories == 'Daily Activity') {
                              context.read<DailyBloc>().add(
                                  FetchDailyPDFMonthly(
                                      noOrder: widget.noOrder,
                                      year: year.toString(),
                                      month: month.toString()));
                            } else if (searchCategories == 'Indeks Populasi') {
                              context.read<IndexHamaBloc>().add(
                                  FetchIndexPDFMonthly(
                                      noOrder: widget.noOrder,
                                      year: year.toString(),
                                      month: month.toString()));
                            } else if (searchCategories == 'Inspeksi Hama') {
                              context.read<InspeksiBloc>().add(
                                  FetchInspeksiPDFMonthly(
                                      noOrder: widget.noOrder,
                                      year: year.toString(),
                                      month: month.toString()));
                            } else if (searchCategories ==
                                'Monitoring Pemakaian') {
                              context.read<PemakaianBloc>().add(
                                  FetchPemakaianPDFMonthly(
                                      noOrder: widget.noOrder,
                                      year: year.toString(),
                                      month: month.toString()));
                            } else if (searchCategories ==
                                'Monitoring Peralatan') {
                              context.read<PeralatanBloc>().add(
                                  FetchPeralatanPDFMonthly(
                                      noOrder: widget.noOrder,
                                      year: year.toString(),
                                      month: month.toString()));
                            } else if (searchCategories == 'Time Sheet') {
                              context.read<AbsenBloc>().add(
                                  FetchAbsenPDFMonthly(
                                      noOrder: widget.noOrder,
                                      year: year.toString(),
                                      month: month.toString()));
                            }
                          } else {
                            widgetsnackbar(
                                context, 'field tidak boleh kosong', redColor);
                          }
                        },
                        child: const Text('Generate Report'),
                      )
                          .animate()
                          .fadeIn()
                          .scale()
                          .move(delay: 300.ms, duration: 600.ms),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
