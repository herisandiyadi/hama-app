import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';

class FormIndexPopulasiHama extends StatefulWidget {
  static const routeName = 'index-populasi-form';
  static const path = 'index-populasi-form';
  const FormIndexPopulasiHama({super.key});

  @override
  State<FormIndexPopulasiHama> createState() => _FormIndexPopulasiHamaState();
}

class _FormIndexPopulasiHamaState extends State<FormIndexPopulasiHama> {
  List<String> listStatus = ['Terkendali', 'Tidak Terkendali'];
  String? status;
  DateTime? dateSelected;

  Future<void> selectedDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
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
        title: const Text('Form Index Populasi Hama'),
        backgroundColor: greenColor,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanggal',
                  style: darkTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => selectedDate(),
                  child: Container(
                    height: 50.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(width: 1, color: greyColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateSelected == null
                                ? 'isi tanggal'
                                : TextUtils().dateFormatId(dateSelected),
                            style: greyTextStyle,
                          ),
                          const Icon(Icons.date_range_outlined)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lokasi',
                  style: darkTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: bold,
                  ),
                ),
                TextFormField(
                  // controller: emailContr,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    hintText: 'isi lokasi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(12.r),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jenis Hama',
                  style: darkTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: bold,
                  ),
                ),
                TextFormField(
                  // controller: emailContr,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    hintText: 'isi jenis hama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(12.r),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Index Populasi',
                  style: darkTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: bold,
                  ),
                ),
                TextFormField(
                  // controller: emailContr,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    hintText: 'isi index populasi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(12.r),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status',
                  style: darkTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: bold,
                  ),
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    hintText: 'Pilih status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(12.r),
                  ),
                  items: listStatus
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: ((value) {
                    final urut = listStatus.indexOf(value!);

                    setState(() {
                      status = listStatus[urut];
                    });
                  }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              height: 55.h,
              width: 1.sw,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(darkColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'SIMPAN',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
