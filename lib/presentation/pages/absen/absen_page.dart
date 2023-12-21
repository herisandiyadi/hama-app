// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/router/router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:hama_app/domain/entities/personal/absen_request.dart';
import 'package:hama_app/presentation/bloc/absen/absen_bloc.dart';
import 'package:hama_app/presentation/bloc/personel/personel_bloc.dart';
import 'package:hama_app/presentation/pages/absen/detail_personal_absen.dart';
import 'package:hama_app/presentation/widget/widget_loading_circle.dart';
import 'package:hama_app/presentation/widget/widget_snackbar.dart';

class AbsenPage extends StatefulWidget {
  static const routeName = 'absen';
  static const path = 'absen';
  final String noOrder;
  const AbsenPage({
    Key? key,
    required this.noOrder,
  }) : super(key: key);

  @override
  State<AbsenPage> createState() => _AbsenPageState();
}

class _AbsenPageState extends State<AbsenPage> with RouteAware {
  TextEditingController namePersonelController = TextEditingController();
  DateTime? dates;
  // List<bool> isSelected = [];
  List<bool> isSelected = List.generate(4, (index) => false);

  Future<void> datePicker() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != dates) {
      setState(() {
        dates = picked;
      });
    }
  }

  bool validate() {
    if (dates == null) {
      return false;
    }
    return true;
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    Future.microtask(() => context
        .read<PersonelBloc>()
        .add(FetchAllPersonel(noOrder: widget.noOrder)));
  }

  @override
  void dispose() {
    super.dispose();
    namePersonelController.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context
        .read<PersonelBloc>()
        .add(FetchAllPersonel(noOrder: widget.noOrder)));
  }

  @override
  Widget build(BuildContext context) {
    print(isSelected);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Absen'),
        backgroundColor: greenColor,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Tanggal Absen',
              style: darkTextStyle.copyWith(
                  fontSize: 14.sp, fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
            onTap: () => datePicker(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 55.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: greyColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dates != null
                            ? TextUtils().dateFormatId(dates)
                            : 'pilih tanggal absen',
                        style: darkTextStyle.copyWith(fontSize: 16.sp),
                      ),
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocBuilder<PersonelBloc, PersonelState>(
            builder: (context, state) {
              if (state is PersonelLoading) {
                return const Center(
                  child: CircleProgress(),
                );
              }
              if (state is PersonelFailed) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is GetPersonelSuccess) {
                if (state.listPersonelEntity.data.isEmpty) {
                  return const Center(
                    heightFactor: 30,
                    child: Text('Data personel kosong'),
                  );
                } else {
                  final data = state.listPersonelEntity.data;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Table(
                              columnWidths: {
                                0: FixedColumnWidth(40.w),
                                1: FixedColumnWidth(150.w),
                                2: FixedColumnWidth(200.w),
                              },
                              border: TableBorder.all(
                                  width: 1.0.w, color: Colors.black),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(
                                        color: softGreyColor),
                                    children: [
                                      Center(
                                        child: Text(
                                          'No',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 16, fontWeight: bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Nama',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 16, fontWeight: bold),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Absen',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 16, fontWeight: bold),
                                        ),
                                      ),
                                    ]),
                              ]),
                          Table(
                            columnWidths: {
                              0: FixedColumnWidth(40.w),
                              1: FixedColumnWidth(150.w),
                              2: FixedColumnWidth(200.w),
                            },
                            border: TableBorder.all(
                                width: 1.0.w, color: Colors.black),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: List.generate(data.length, (index) {
                              isSelected = List.generate(
                                  data.length, (index) => false,
                                  growable: true);
                              return TableRow(children: [
                                Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: darkTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => context.goNamed(
                                      DetailPersonalAbsen.routeName,
                                      extra: {
                                        'name': data[index].name,
                                        'noOrder': widget.noOrder,
                                        'id': data[index].id
                                      }),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      data[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: darkTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),

                                // if (state is AddAbsenSuccess) {
                                //       widgetsnackbar(
                                //           context, state.message, greenColor);
                                //     }

                                //     if (state is AbsenFailed) {
                                //       widgetsnackbar(
                                //           context, state.message, redColor);
                                //     }
                                BlocListener<AbsenBloc, AbsenState>(
                                  listener: (context, state) {
                                    if (state is AddAbsenSuccess) {
                                      widgetsnackbar(
                                          context, state.message, greenColor);
                                    }

                                    if (state is AbsenFailed) {
                                      widgetsnackbar(
                                          context, state.message, redColor);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    isSelected[index]
                                                        ? greyColor
                                                        : greenColor)),
                                        onPressed: () {
                                          if (validate()) {
                                            setState(() {
                                              isSelected[index] = true;
                                            });
                                            context
                                                .read<AbsenBloc>()
                                                .add(AddAbsenEvent(
                                                    absenRequest: AbsenRequest(
                                                  idPerson:
                                                      data[index].id.toString(),
                                                  tanggal: TextUtils()
                                                      .dateFormatInt(dates),
                                                  keterangan: 'Hadir',
                                                  noOrder: widget.noOrder,
                                                )));
                                          } else {
                                            widgetsnackbar(
                                                context,
                                                'Tanggal belum di set',
                                                redColor);
                                          }
                                        },
                                        child: Text(
                                          'Hadir',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    redColor)),
                                        onPressed: () {
                                          if (validate()) {
                                            context
                                                .read<AbsenBloc>()
                                                .add(AddAbsenEvent(
                                                    absenRequest: AbsenRequest(
                                                  idPerson:
                                                      data[index].id.toString(),
                                                  tanggal: TextUtils()
                                                      .dateFormatInt(dates),
                                                  keterangan: 'Tidak Hadir',
                                                  noOrder: widget.noOrder,
                                                )));
                                            setState(() {
                                              isSelected[index] = true;
                                            });
                                          } else {
                                            widgetsnackbar(
                                                context,
                                                'Tanggal belum di set',
                                                redColor);
                                          }
                                        },
                                        child: Text(
                                          'Tidak Hadir',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]);
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    ));
  }
}
