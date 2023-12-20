import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:image_picker/image_picker.dart';

class FormDailyActivity extends StatefulWidget {
  static const routeName = 'daily_activity-form';
  static const path = 'daily_activity-form';
  final String noOrder;
  const FormDailyActivity({super.key, required this.noOrder});

  @override
  State<FormDailyActivity> createState() => _FormDailyActivityState();
}

class _FormDailyActivityState extends State<FormDailyActivity> {
  TextEditingController locationController = TextEditingController();
  TextEditingController hamaDitemukanController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  List<String> jenisTreatment = [
    'Monitoring & Spraying',
    'Mekanik',
    'Thermal Fogging',
    'Baiting(Baiting Gel)',
    'Rodent Control(Umpan racun)',
    'Larvaciding',
    'Monitoring Trapping',
    'Cold Fogging',
    'Misting',
    'Lainnya'
  ];
  String? treatment;
  DateTime? dateSelected;
  List<XFile> _listImagePaths = [];
  ImagePicker picker = ImagePicker();

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

  void imagePick() async {
    final result = await picker.pickMultiImage(imageQuality: 50);
    setState(() {
      _listImagePaths = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Daily Activity'),
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
                    controller: locationController,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis Treatment',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      hintText: 'Jenis Treatment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.all(12.r),
                    ),
                    items: jenisTreatment
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: ((value) {
                      final urut = jenisTreatment.indexOf(value!);

                      setState(() {
                        treatment = jenisTreatment[urut];
                      });
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis Hama yang ditemukan',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  TextFormField(
                    controller: hamaDitemukanController,
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
                    'Jumlah',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  TextFormField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      hintText: 'isi jumlah',
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
              child: Container(
                height: 250.h,
                width: 360.w,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.w, color: greenColor),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Wrap(
                        children: _listImagePaths.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8, bottom: 8),
                            child: Container(
                                height: 80.h,
                                width: 80.w,
                                decoration:
                                    const BoxDecoration(color: whiteColor),
                                child: Image.file(
                                  File(
                                    e.path,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          );
                        }).toList(),
                      ),
                      GestureDetector(
                        onTap: () {
                          imagePick();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: const BoxDecoration(color: blueColor),
                            child: const Icon(
                              Icons.add,
                              color: whiteColor,
                              size: 48,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    'Keterangan',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  TextFormField(
                    controller: keteranganController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      hintText: 'isi Keterangan',
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
      ),
    );
  }
}
