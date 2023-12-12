import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';

class FormInspeksiAksesHama extends StatefulWidget {
  static const routeName = 'inspeksi-akses-hama-form';
  static const path = 'inspeksi-akses-hama-form';
  const FormInspeksiAksesHama({super.key});

  @override
  State<FormInspeksiAksesHama> createState() => _FormInspeksiAksesHamaState();
}

class _FormInspeksiAksesHamaState extends State<FormInspeksiAksesHama> {
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
          title: const Text('Form Inspeksi Akses Hama'),
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
              child: Text(
                'Gambar/Foto Dokumentasi',
                style: darkTextStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: bold,
                ),
              ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: const BoxDecoration(color: greyColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(color: greyColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(color: greyColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(color: greyColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(color: greyColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(color: greyColor),
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
                    // controller: emailContr,
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rekomendasi',
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
                      hintText: 'isi rekomendasi',
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
