import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_request.dart';
import 'package:hama_app/presentation/bloc/inspeksi/inspeksi_bloc.dart';
import 'package:hama_app/presentation/pages/form/inspeksi/list_inspeksi_hama_page.dart';
import 'package:hama_app/presentation/widget/widget_snackbar.dart';
import 'package:image_picker/image_picker.dart';

class FormInspeksiAksesHama extends StatefulWidget {
  static const routeName = 'inspeksi-akses-hama-form';
  static const path = 'inspeksi-akses-hama-form';
  final String noOrder;
  const FormInspeksiAksesHama({super.key, required this.noOrder});

  @override
  State<FormInspeksiAksesHama> createState() => _FormInspeksiAksesHamaState();
}

class _FormInspeksiAksesHamaState extends State<FormInspeksiAksesHama> {
  TextEditingController locationController = TextEditingController();
  TextEditingController rekomendasiController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  DateTime? dateSelected;
  XFile? pickImage;
  ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    locationController.dispose();
    rekomendasiController.dispose();
    keteranganController.dispose();
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

  void imagePick() async {
    final result = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickImage = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Inspeksi Akses Hama'),
          backgroundColor: greenColor,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
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
                        pickImage != null
                            ? SizedBox(
                                height: 150.h,
                                width: 80.w,
                                child: Image.file(File(pickImage!.path)),
                              )
                            : const SizedBox(),
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
                      controller: rekomendasiController,
                      autovalidateMode: AutovalidateMode.always,
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
              BlocListener<InspeksiBloc, InspeksiState>(
                listener: (context, state) {
                  if (state is AddInspeksiSuccess) {
                    context.goNamed(ListInspeksiHamaPage.routeName,
                        extra: widget.noOrder);
                  }
                  if (state is InspeksiFailed) {
                    widgetsnackbar(context, state.message, redColor);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    height: 55.h,
                    width: 1.sw,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(darkColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final inspeksiRequest = InspeksiRequest(
                              lokasi: locationController.text,
                              rekomendasi: rekomendasiController.text,
                              tanggal: TextUtils().dateFormatInt(dateSelected),
                              keterangan: keteranganController.text,
                              buktiFoto: pickImage!.path);
                          context.read<InspeksiBloc>().add(FetchAddInspeksi(
                              inspeksiRequest: inspeksiRequest,
                              noOrder: widget.noOrder));
                        }
                      },
                      child: Text(
                        'SIMPAN',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
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
