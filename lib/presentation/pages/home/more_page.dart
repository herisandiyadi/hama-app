import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:hama_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:hama_app/presentation/pages/auth/login_page.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final GlobalKey<SfSignaturePadState> signaturePadKey =
      GlobalKey<SfSignaturePadState>();
  File? filePdf;
  Uint8List? image;
  @override
  Widget build(BuildContext context) {
    List<List<String>> tableData = [
      ['Header 1', 'Header 2', 'Header 3'],
      ['Data 1.1', 'Data 1.2', 'Data 1.3'],
      ['Data 2.1', 'Data 2.2', 'Data 2.3'],
      ['Data 3.1', 'Data 3.2', 'Data 3.3'],
    ];

    const String customerName = 'John Doe';

    final List<String> products = [
      'Product A',
      'Product B',
      'Product C',
      'asdas',
      'asdasd',
      'asdasd'
    ];
    final List<double> prices = [
      19.99,
      29.99,
      39.99,
      400.0,
      23.00,
      20.00,
    ];

    Future<Uint8List> saveSignature() async {
      ui.Image signatureData = await signaturePadKey.currentState!.toImage();
      ByteData? byteData =
          await signatureData.toByteData(format: ui.ImageByteFormat.png);
      Uint8List signData = byteData!.buffer.asUint8List();
      return signData;
    }

    Future<void> addSignatureToPDF(
        String existingPdfPath, String outputPdfPath) async {
      // Baca dokumen PDF yang sudah ada
      final PdfDocument existingDocument = PdfDocument();

      // Tambahkan halaman baru ke dokumen
      final PdfPage page = existingDocument.pages.add();
      final signatureData = await signaturePadKey.currentState!.toImage();
      Uint8List data = signatureData as Uint8List;
      print(data);
      // Ambil data tanda tangan
      // final List<int> signatureData = await getSignatureData();

      // Tambahkan gambar tanda tangan ke halaman PDF
      // final PdfBitmap signatureImage = PdfBitmap(signatureData.);
      // page.graphics.drawImage(
      //     signatureImage, Rect.fromPoints(Offset(50, 50), Offset(250, 250)));

      // Simpan dokumen PDF yang sudah dimodifikasi
      final List<int> bytes = await existingDocument.save();
      await File(outputPdfPath).writeAsBytes(bytes);

      // Tutup dokumen PDF
      existingDocument.dispose();
    }

    Future<String> getFilePath() async {
      // return '${directory.path}/example_syncfusion_with_signature.pdf';

      Directory? directory;

      directory = await DownloadsPathProvider.downloadsDirectory;

      final savePath =
          '${directory!.path}/example_syncfusion_with_signature.pdf';
      return savePath;
    }

    void generatePDF(
      List<List<String>> data,
    ) async {
      // Buat dokumen PDF
      final PdfDocument document = PdfDocument();

      // Tambahkan halaman ke dokumen
      final PdfPage page = document.pages.add();

      // Buat tabel
      final PdfGrid grid = PdfGrid();
      grid.columns.add(count: data[0].length);
      grid.headers.add(1);

      // Set data untuk header
      for (int i = 0; i < data[0].length; i++) {
        grid.headers[0].cells[i].value = data[0][i];
      }

      // Set data untuk sel
      for (int i = 1; i < data.length; i++) {
        final PdfGridRow row = grid.rows.add();
        for (int j = 0; j < data[i].length; j++) {
          row.cells[j].value = data[i][j];
        }
      }

      // Gambar tabel di halaman
      grid.draw(
        page: page,
        bounds: const Rect.fromLTWH(10, 10, 0, 0),
      );

      // Tambahkan kolom tanda tangan
      // final PdfGrid signatureGrid = PdfGrid();
      // signatureGrid.columns.add(count: 1);
      // signatureGrid.headers.add(1);

      // // Set data untuk header kolom tanda tangan
      // // signatureGrid.headers[0].cells[0].value = signatureColumn;

      // // Gambar tabel tanda tangan di halaman
      // signatureGrid.draw(
      //   page: page,
      //   bounds: Rect.fromLTWH(10, page.getClientSize().height - 100, 0, 0),
      // );

      // Simpan dokumen PDF ke file
      final List<int> bytes = await document.save();

      final String filePath = await getFilePath();
      await File(filePath).writeAsBytes(bytes);

      OpenAppFile.open(filePath);

      // Tutup dokumen PDF
      document.dispose();
    }

    Future<void> generateInvoicePDF(String customerName, List<String> products,
        List<double> prices, Uint8List image) async {
      final response =
          await http.get(Uri.parse('$baseUrl/uploads/peralatan-202312.pdf'));

      if (response.statusCode == 200) {
        // Dapatkan direktori penyimpanan lokal
        final directory = await getApplicationDocumentsDirectory();

        // Tentukan path untuk menyimpan PDF di lokal
        final filePath = '${directory.path}/downloaded_pdf.pdf';

        // Tulis data PDF ke file lokal
        filePdf = File(filePath);
        await filePdf!.writeAsBytes(response.bodyBytes);
        OpenAppFile.open(filePdf!.path);

        print('PDF berhasil diunduh ke: $filePath');
      } else {
        print('Gagal mengunduh PDF. Kode status: ${response.statusCode}');
      }

      final existingPdfBytes = filePdf!.readAsBytesSync();
      final existingPdfDocument =
          PdfDocument(inputBytes: existingPdfBytes.toList());

      final date = DateTime.now();
      // Buat dokumen PDF
      final PdfDocument document = PdfDocument();
      document.pageSettings.orientation;
      // Tambahkan halaman ke dokumen
      final PdfPage page = existingPdfDocument.pages.add();

      // Tambahkan konten ke halaman
      final PdfGraphics graphics = page.graphics;
      // graphics.drawString('MONITORING PERALATAN PEST CONTROL ',
      //     PdfStandardFont(PdfFontFamily.helvetica, 18),
      //     bounds: Rect.fromLTWH(0, 10, page.getClientSize().width, 30),
      //     format: PdfStringFormat(alignment: PdfTextAlignment.center));

      // graphics.drawString('Tanggal : ${TextUtils().dateFormatId(date)}',
      //     PdfStandardFont(PdfFontFamily.helvetica, 12),
      //     bounds: Rect.fromLTWH(0, 50, page.getClientSize().width, 20));
      // graphics.drawString('Periode : ${TextUtils().monthFormatInt(date)}',
      //     PdfStandardFont(PdfFontFamily.helvetica, 12),
      //     bounds: Rect.fromLTWH(0, 65, page.getClientSize().width, 20));
      // graphics.drawString('Berikut daftar peralatan di Project ...........',
      //     PdfStandardFont(PdfFontFamily.helvetica, 12),
      //     bounds: Rect.fromLTWH(0, 80, page.getClientSize().width, 20));

      // Tambahkan total harga ke halaman

      final PdfBitmap signatureImage = PdfBitmap(image);
      graphics.drawString(
          'Disiapkan Oleh,', PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(30, page.getClientSize().height - 180,
              page.getClientSize().width, 20));
      graphics.drawString(
          'Personel,', PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(30, page.getClientSize().height - 165,
              page.getClientSize().width, 20));

      page.graphics.drawImage(signatureImage,
          Rect.fromLTWH(0, page.getClientSize().height - 165, 130, 86.67));
      graphics.drawString('----------------------',
          PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(30, page.getClientSize().height - 75,
              page.getClientSize().width, 20));

      // Simpan dokumen PDF ke file
      final List<int> bytes = await document.save();
      final String filePath = await getFilePath();

      await File(filePath).writeAsBytes(bytes);
      OpenAppFile.open(filePath);

      // Tutup dokumen PDF
      document.dispose();
    }

    Widget header() {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              greenColor,
              whiteColor,
              whiteColor,
              greenColor,
            ],
          ),
        ),
        height: 120.h,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 30.w, top: 21.h, bottom: 21.h, right: 16.w),
              child: SizedBox(
                height: 56.h,
                width: 56.w,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  child: Icon(
                    Icons.person,
                    size: 35.h,
                    color: greyColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name',
                    maxLines: 2,
                    style: whiteTextStyle.copyWith(
                        fontSize: 18.sp, fontWeight: bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Column(
      children: [
        header(),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              context.goNamed(LoginPage.routeName);
            }
          },
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(const FetchLogout());
            },
            child: const Text('Logout'),
          ),
        ),
        SizedBox(
          height: 200,
          width: 300,
          child: SfSignaturePad(
            key: signaturePadKey,
            minimumStrokeWidth: 1,
            maximumStrokeWidth: 3,
            strokeColor: darkColor,
            backgroundColor: transparentColor,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () async {
              final data = await saveSignature();
              generateInvoicePDF(customerName, products, prices, data);
            },
            child: Text('Sign'))
      ],
    );
  }
}
