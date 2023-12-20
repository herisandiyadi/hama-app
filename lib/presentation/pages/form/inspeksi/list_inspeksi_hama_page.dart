import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:hama_app/presentation/bloc/inspeksi/inspeksi_bloc.dart';
import 'package:hama_app/presentation/pages/form/inspeksi/form_inspeksi_akses_hama.dart';
import 'package:hama_app/presentation/widget/widget_loading_circle.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ListInspeksiHamaPage extends StatefulWidget {
  static const routeName = 'list-inspeksi-hama-page';
  static const path = 'list-inspeksi-hama-page';
  final String noOrder;
  const ListInspeksiHamaPage({
    Key? key,
    required this.noOrder,
  }) : super(key: key);

  @override
  State<ListInspeksiHamaPage> createState() => _ListInspeksiHamaPageState();
}

class _ListInspeksiHamaPageState extends State<ListInspeksiHamaPage> {
  final List<String> listSearch = ['by Date', 'by Month'];
  String? searchCategories;
  DateTime? dateSelected;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context
        .read<InspeksiBloc>()
        .add(FetchGetAllInspeksi(noOrder: widget.noOrder)));
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
        backgroundColor: greenColor,
        title: const Text('List Inspeksi Hama'),
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
                      context.goNamed(FormInspeksiAksesHama.routeName,
                          extra: widget.noOrder);
                    },
                    child: Text(
                      'Tambah Form Inspeksi',
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
                width: 150.w,
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
                          dateSelected != null
                              ? searchCategories == 'by Date'
                                  ? TextUtils().dateFormatInt(dateSelected)
                                  : TextUtils().monthFormatInt(dateSelected)
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
                      onPressed: searchCategories == 'by Date'
                          ? () {
                              context.read<InspeksiBloc>().add(
                                  FetchGetAllByDateInspeksi(
                                      noOrder: widget.noOrder,
                                      date: TextUtils()
                                          .dateFormatInt(dateSelected)));
                            }
                          : searchCategories == 'by Month'
                              ? () {
                                  final year = dateSelected!.year;
                                  final month = dateSelected!.month;
                                  context.read<InspeksiBloc>().add(
                                      FetchGetAllByMonthInspeksi(
                                          noOrder: widget.noOrder,
                                          year: year.toString(),
                                          month: month.toString()));
                                }
                              : null,
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
            height: 1.sh - 250.h,
            child: BlocBuilder<InspeksiBloc, InspeksiState>(
              builder: (context, state) {
                if (state is GetInspeksiSuccess) {
                  if (state.listInspeksiEntity.data.isEmpty) {
                    return const Center(child: Text('Data Kosong'));
                  } else {
                    return ListView.builder(
                      itemCount: state.listInspeksiEntity.data.length,
                      itemBuilder: (context, index) {
                        final data = state.listInspeksiEntity.data[index];
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
                                leading: SizedBox(
                                  height: 160.h,
                                  width: 80.w,
                                  child: Image.network(
                                    '$imageUrl/${data.buktiFoto}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  'Lokasi : ${data.lokasi}',
                                  style:
                                      darkTextStyle.copyWith(fontSize: 18.sp),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rekomendasi : ${data.rekomendasi}',
                                      style: darkTextStyle.copyWith(
                                          fontSize: 14.sp),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Keterangan: ${data.keterangan}',
                                      style: darkTextStyle.copyWith(
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      'Tanggal : ${data.tanggal}',
                                      style: darkTextStyle.copyWith(
                                          fontSize: 10.sp),
                                    )
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
                if (state is InspeksiLoading) {
                  return const Center(
                    child: CircleProgress(),
                  );
                }
                if (state is InspeksiFailed) {
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
