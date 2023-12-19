// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/presentation/bloc/peralatan/peralatan_bloc.dart';
import 'package:hama_app/presentation/pages/form/peralatan/form_monitoring_peralatan.dart';
import 'package:hama_app/presentation/widget/widget_loading_circle.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ListMonitoringPeralatanPage extends StatefulWidget {
  static const routeName = 'monitoring-tools-page';
  static const path = 'monitoring-tools-page';
  final String noOrder;
  const ListMonitoringPeralatanPage({
    Key? key,
    required this.noOrder,
  }) : super(key: key);

  @override
  State<ListMonitoringPeralatanPage> createState() =>
      _ListMonitoringPeralatanPageState();
}

class _ListMonitoringPeralatanPageState
    extends State<ListMonitoringPeralatanPage> {
  final List<String> listSearch = ['by Date', 'by Month'];
  String? searchCategories;
  DateTime? dateSelected;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context
        .read<PeralatanBloc>()
        .add(FetchAllPeralatan(noOrder: widget.noOrder)));
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
    // final DateTime? picked = await showMonthYearPicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2015, 8),
    //     lastDate: DateTime.now());
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
    print(dateSelected);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: const Text('List Monitoring Peralatan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 45.h,
                  width: 220.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(darkColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.goNamed(FormMonitoringPeralatan.routeName,
                          extra: widget.noOrder);
                    },
                    child: Text(
                      'Tambah Form Peralatan',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 55.h,
                width: 120.w,
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
              SizedBox(
                width: 14.w,
              ),
              GestureDetector(
                onTap: () {
                  searchCategories == 'by Date'
                      ? selectedDate()
                      : selectedMonth();
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
                          '',
                          style: greyTextStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: bold,
                          ),
                        ),
                        Icon(Icons.date_range),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              SizedBox(
                width: 50.w,
                height: 55.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(greyColor)),
                    onPressed: () {},
                    child: Center(
                      child: const Icon(
                        Icons.search,
                        color: whiteColor,
                      ),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 1.sh - 250.h,
            child: BlocBuilder<PeralatanBloc, PeralatanState>(
              builder: (context, state) {
                if (state is GetALlPeralatanSuccess) {
                  if (state.listPeralatanEntity.data.isEmpty) {
                    return const Center(child: Text('Data Kosong'));
                  } else {
                    return ListView.builder(
                      itemCount: state.listPeralatanEntity.data.length,
                      itemBuilder: (context, index) {
                        final data = state.listPeralatanEntity.data[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: softGreyColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(10.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                style: ListTileStyle.drawer,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.name,
                                      style: darkTextStyle.copyWith(
                                          fontSize: 18.sp),
                                    ),
                                    Text(
                                      'Kondisi ${data.kondisi}',
                                      style: data.kondisi == 'Baik'
                                          ? greenTextStyle.copyWith(
                                              fontSize: 14.sp)
                                          : redTextSytle.copyWith(
                                              fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Merk : ${data.merek}',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Jumlah : ${data.jumlah} ${data.satuan}',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                    Text('Tanggal : ${data.tanggal}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
                if (state is PeralatanLoading) {
                  return Center(
                    child: CircleProgress(),
                  );
                }
                if (state is PeralatanFailed) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    ));
  }
}
