import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';

class FormMonitoringPeralatan extends StatefulWidget {
  static const routeName = 'monitoring-tools-form';
  static const path = 'monitoring-tools-form';
  const FormMonitoringPeralatan({super.key});

  @override
  State<FormMonitoringPeralatan> createState() =>
      _FormMonitoringPeralatanState();
}

class _FormMonitoringPeralatanState extends State<FormMonitoringPeralatan> {
  final TextEditingController merkController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController satuanController = TextEditingController();
  List<String> listPeralatan = [];
  List<String> kondisiPeralatan = ['Baik', 'Rusak'];
  String? peralatan;
  String? kondisi;
  DateTime? dateSelected;

  @override
  void dispose() {
    merkController.dispose();
    jumlahController.dispose();
    satuanController.dispose();
    super.dispose();
  }

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
          title: const Text('Form Monitoring Peralatan'),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Peralatan',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      hintText: 'Pilih Peralatan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.all(12.r),
                    ),
                    items: listPeralatan
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: ((value) {
                      final urut = listPeralatan.indexOf(value!);

                      setState(() {
                        peralatan = listPeralatan[urut];
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
                    'Merk Peralatan',
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
                      hintText: 'isi merk peralatan',
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
                    'Jumlah Peralatan',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  TextFormField(
                    // controller: emailContr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      hintText: 'isi jumlah peralatan',
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
                    'Satuan Peralatan',
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
                      hintText: 'isi satuan peralatan',
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
                    'Kondisi Peralatan',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      hintText: 'Kondisi Peralatan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.all(12.r),
                    ),
                    items: kondisiPeralatan
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: ((value) {
                      final urut = kondisiPeralatan.indexOf(value!);

                      setState(() {
                        kondisi = kondisiPeralatan[urut];
                      });
                    }),
                  ),
                ],
              ),
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
