// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/router/router.dart';
import 'package:hama_app/presentation/bloc/personel/personel_bloc.dart';
import 'package:hama_app/presentation/pages/absen/detail_personal_absen.dart';
import 'package:hama_app/presentation/widget/widget_loading_circle.dart';

import 'package:hama_app/common/style/style.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PersonelPage extends StatefulWidget {
  static const routeName = 'personel';
  static const path = 'personel';
  final String noOrder;
  const PersonelPage({Key? key, required this.noOrder}) : super(key: key);

  @override
  State<PersonelPage> createState() => _PersonelPageState();
}

class _PersonelPageState extends State<PersonelPage> with RouteAware {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namePersonelController = TextEditingController();

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
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Personel'),
        backgroundColor: greenColor,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Form(
                              key: _formKey,
                              child: AlertDialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.zero,
                                content: Container(
                                  height: 350.h,
                                  width: 1.sw,
                                  padding: const EdgeInsets.all(24),
                                  decoration:
                                      const BoxDecoration(color: whiteColor),
                                  child: ListView(
                                    children: [
                                      Text(
                                        'Personel',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 18.sp, fontWeight: bold),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Masukkan Nama Personel';
                                          }
                                          return null;
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        controller: namePersonelController,
                                        decoration: InputDecoration(
                                          labelText: 'Nama personel',
                                          labelStyle: darkTextStyle.copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      SizedBox(
                                        height: 45.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context.read<PersonelBloc>().add(
                                                FetchAddPersonel(
                                                    namePersonel:
                                                        namePersonelController
                                                            .text,
                                                    noOrder: widget.noOrder));

                                            Future.delayed(
                                                const Duration(seconds: 1));

                                            context.pop();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              greenColor,
                                            ),
                                          ),
                                          child: Text(
                                            'Save',
                                            style: whiteTextStyle.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text(
                      'Tambah Personel',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Table(
                              columnWidths: {
                                0: FixedColumnWidth(40.w),
                                1: FixedColumnWidth(180.w),
                                2: FixedColumnWidth(180.w),
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
                                      Center(
                                        child: Text(
                                          'Nama',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 16, fontWeight: bold),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Action',
                                          style: darkTextStyle.copyWith(
                                              fontSize: 16, fontWeight: bold),
                                        ),
                                      ),
                                    ]),
                              ]),
                          Table(
                              columnWidths: {
                                0: FixedColumnWidth(40.w),
                                1: FixedColumnWidth(180.w),
                                2: FixedColumnWidth(180.w),
                              },
                              border: TableBorder.all(
                                  width: 1.0.w, color: Colors.black),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: List.generate(
                                data.length,
                                (index) => TableRow(children: [
                                  Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: darkTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      data[index].name,
                                      style: darkTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Form(
                                                    key: _formKey,
                                                    child: AlertDialog(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      content: Container(
                                                        height: 350.h,
                                                        width: 1.sw,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24),
                                                        decoration:
                                                            const BoxDecoration(
                                                                color:
                                                                    whiteColor),
                                                        child: ListView(
                                                          children: [
                                                            Text(
                                                              'Ubah Nama Personel ${data[index].name}',
                                                              style: darkTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          18.sp,
                                                                      fontWeight:
                                                                          bold),
                                                            ),
                                                            SizedBox(
                                                              height: 30.h,
                                                            ),
                                                            TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .always,
                                                              controller:
                                                                  namePersonelController,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    data[index]
                                                                        .name,
                                                                hintStyle:
                                                                    greyTextStyle
                                                                        .copyWith(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      bold,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 30.h,
                                                            ),
                                                            SizedBox(
                                                              height: 45.h,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  context.read<PersonelBloc>().add(FetchUpdatePersonel(
                                                                      id:
                                                                          '${data[index].id}',
                                                                      noOrder:
                                                                          widget
                                                                              .noOrder,
                                                                      namePersonel:
                                                                          namePersonelController
                                                                              .text));

                                                                  Future.delayed(
                                                                      const Duration(
                                                                          seconds:
                                                                              1));

                                                                  context.pop();
                                                                },
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    greenColor,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  'Ubah',
                                                                  style: whiteTextStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 30.h,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: blueColor,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            context.goNamed(
                                                DetailPersonalAbsen.routeName,
                                                extra: {
                                                  'name': data[index].name,
                                                  'noOrder': widget.noOrder,
                                                  'id': data[index].id
                                                });
                                          },
                                          icon: const Icon(
                                            Icons.visibility,
                                            color: greenColor,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            Alert(
                                                context: context,
                                                title: 'Konfirmasi',
                                                desc:
                                                    'Anda yakin ingin hapus ${data[index].name}',
                                                buttons: [
                                                  DialogButton(
                                                      color: greenColor,
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                PersonelBloc>()
                                                            .add(FetchDeletePersonel(
                                                                id:
                                                                    '${data[index].id}',
                                                                noOrder: widget
                                                                    .noOrder));
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 1));
                                                        context.pop();
                                                      }),
                                                  DialogButton(
                                                      color: redColor,
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () =>
                                                          context.pop()),
                                                ]).show();
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: redColor,
                                          )),
                                    ],
                                  )),
                                ]),
                              )),
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
