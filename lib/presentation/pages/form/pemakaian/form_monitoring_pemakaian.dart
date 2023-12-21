import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_request.dart';
import 'package:hama_app/presentation/bloc/pemakaian/pemakaian_bloc.dart';
import 'package:hama_app/presentation/pages/form/pemakaian/list_monitoring_pemakaian_page.dart';

class FormMonitoringPemakaian extends StatefulWidget {
  static const routeName = 'monitoring-pemakaian-form';
  static const path = 'monitoring-pemakaian-form';
  final String noOrder;
  const FormMonitoringPemakaian({super.key, required this.noOrder});

  @override
  State<FormMonitoringPemakaian> createState() =>
      _FormMonitoringPemakaianState();
}

class _FormMonitoringPemakaianState extends State<FormMonitoringPemakaian> {
  TextEditingController namaBahanController = TextEditingController();
  TextEditingController bahanAktifController = TextEditingController();
  TextEditingController merkController = TextEditingController();
  TextEditingController stockAwalController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController inController = TextEditingController();
  TextEditingController outController = TextEditingController();
  TextEditingController stockAkhirController = TextEditingController();
  TextEditingController satuanBController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> listBahan = [
    'Racun tikus',
    'Larvasida',
    'Pestisida cair',
    'Gel Semut',
    'Gel Kecoa',
    'Cockroach Trap',
    'Lem Tikus',
    'Lainnya'
  ];
  String? bahan;
  DateTime? dateSelected;

  @override
  void dispose() {
    namaBahanController.dispose();
    bahanAktifController.dispose();
    merkController.dispose();
    stockAwalController.dispose();
    satuanController.dispose();
    inController.dispose();
    outController.dispose();
    stockAkhirController.dispose();
    satuanBController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Monitoring Pemakaian Chemical/Non Chemical'),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Bahan',
                      style: darkTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: bold,
                      ),
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        fillColor: whiteColor,
                        filled: true,
                        hintText: 'Pilih Bahan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.all(12.r),
                      ),
                      items: listBahan
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: ((value) {
                        final urut = listBahan.indexOf(value!);

                        setState(() {
                          bahan = listBahan[urut];
                        });
                      }),
                    ),
                    bahan == 'Lainnya'
                        ? TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            controller: namaBahanController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              hintText: 'Nama Bahan',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12.r),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bahan Aktif',
                      style: darkTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: bold,
                      ),
                    ),
                    TextFormField(
                      controller: bahanAktifController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: whiteColor,
                        filled: true,
                        hintText: 'isi bahan aktif',
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
                      'Merk',
                      style: darkTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: bold,
                      ),
                    ),
                    TextFormField(
                      controller: merkController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: whiteColor,
                        filled: true,
                        hintText: 'isi Merk',
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
                      'Stok Awal',
                      style: darkTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: TextFormField(
                            controller: stockAwalController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              hintText: 'jumlah stok awal',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: satuanController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              hintText: 'satuan',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12.r),
                            ),
                          ),
                        ),
                      ],
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
                      'Mutasi',
                      style: darkTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: TextFormField(
                            controller: inController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: whiteColor,
                              labelText: 'IN',
                              filled: true,
                              hintText: 'In',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 170.w,
                          child: TextFormField(
                            controller: outController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: whiteColor,
                              labelText: 'OUT',
                              filled: true,
                              hintText: 'Out',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12.r),
                            ),
                          ),
                        ),
                      ],
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
                      'Stok Akhir',
                      style: darkTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: TextFormField(
                            controller: stockAkhirController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              hintText: 'jumlah stok akhir',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: satuanBController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              hintText: 'satuan',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              BlocListener<PemakaianBloc, PemakaianState>(
                listener: (context, state) {
                  if (state is AddPemakaianSuccess) {
                    context.goNamed(ListMonitoringPemakaianPage.routeName,
                        extra: {'noOrder': widget.noOrder});
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
                        final pemakaianRequest = PemakaianRequest(
                          name: bahan == 'Lainnya'
                              ? namaBahanController.text
                              : bahan!,
                          bahanAktif: bahanAktifController.text,
                          merk: merkController.text,
                          stokAwal: int.parse(stockAwalController.text),
                          satuan: satuanController.text,
                          tanggal: TextUtils().dateFormatInt(dateSelected),
                          ins: int.parse(inController.text),
                          noOrder: widget.noOrder,
                          out: int.parse(outController.text),
                          stokAkhir: int.parse(stockAkhirController.text),
                          satuanb: satuanBController.text,
                        );
                        if (_formKey.currentState!.validate()) {
                          context.read<PemakaianBloc>().add(FetchAddPemakaian(
                              pemakaianRequest: pemakaianRequest));
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
