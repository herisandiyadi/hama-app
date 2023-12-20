// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:hama_app/presentation/bloc/absen/absen_bloc.dart';
import 'package:hama_app/presentation/widget/widget_loading_circle.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class DetailPersonalAbsen extends StatefulWidget {
  static const routeName = 'detail-personal-absen';
  static const path = 'detail-personal-absen';
  final String noOrder;
  final int id;
  final String name;
  const DetailPersonalAbsen({
    Key? key,
    required this.noOrder,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<DetailPersonalAbsen> createState() => _DetailPersonalAbsenState();
}

class _DetailPersonalAbsenState extends State<DetailPersonalAbsen> {
  DateTime? dateSelected;

  @override
  void initState() {
    Future.microtask(() => context.read<AbsenBloc>().add(
        FetchAbsenPerson(noOrder: widget.noOrder, id: widget.id.toString())));
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Data Absen ${widget.name}'),
        backgroundColor: greenColor,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 55.h,
                  width: 150.w,
                  child: const Text('Search By Month')),
              SizedBox(
                width: 14.w,
              ),
              GestureDetector(
                onTap: () {
                  selectedMonth();
                },
                child: Container(
                  height: 55.h,
                  width: 160.w,
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
                              ? TextUtils().dateFormatInt(dateSelected)
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
              ),
              SizedBox(
                width: 14.w,
              ),
              SizedBox(
                width: 55.w,
                height: 55.h,
                child: Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(greyColor)),
                      onPressed: () {
                        final year = dateSelected!.year;
                        final month = dateSelected!.month;
                        context.read<AbsenBloc>().add(FetchAbsenPersonByMonth(
                            noOrder: widget.noOrder,
                            id: widget.id.toString(),
                            year: year.toString(),
                            month: month.toString()));
                      },
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: whiteColor,
                        ),
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocBuilder<AbsenBloc, AbsenState>(
            builder: (context, state) {
              if (state is AbsenLoading) {
                return const Center(
                  child: CircleProgress(),
                );
              }
              if (state is AbsenFailed) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is GetAbsenSuccess) {
                if (state.dataAbsenEntity.data.isEmpty) {
                  return const Center(
                    heightFactor: 30,
                    child: Text('Data absen kosong'),
                  );
                } else {
                  final data = state.dataAbsenEntity.data;
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
                                      Text(
                                        'No',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Tanggal',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                      ),
                                      Text(
                                        'Absen',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 14, fontWeight: bold),
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
                              return TableRow(children: [
                                Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: darkTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    TextUtils()
                                        .dateFormatId(data[index].tanggal),
                                    overflow: TextOverflow.ellipsis,
                                    style: darkTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    data[index].keterangan,
                                    overflow: TextOverflow.ellipsis,
                                    style: darkTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
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
