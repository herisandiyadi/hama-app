import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/presentation/bloc/signature/signature_bloc.dart';
import 'package:hama_app/presentation/widget/widget_snackbar.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignaturePage extends StatefulWidget {
  static const routeName = 'signature';
  static const path = 'signature';
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  int? jumlahSign;
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<SignatureBloc>().add(FetchGetAllSignature()));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SfSignaturePadState> signaturePadKey =
        GlobalKey<SfSignaturePadState>();

    Future<Uint8List> saveSignature() async {
      ui.Image signatureData = await signaturePadKey.currentState!.toImage();
      ByteData? byteData =
          await signatureData.toByteData(format: ui.ImageByteFormat.png);
      Uint8List signData = byteData!.buffer.asUint8List();
      return signData;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: greenColor,
          title: const Text('Signature'),
        ),
        body: BlocListener<SignatureBloc, SignatureState>(
          listener: (context, state) {
            if (state is SaveSignatureSuccess) {
              widgetsnackbar(context, state.message, greenColor);
              signaturePadKey.currentState!.clear();
            }
            if (state is GetAllSignatureSuccess) {
              setState(() {
                jumlahSign = state.listEntity.length;
                print(jumlahSign);
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Signature Pad',
                      style: darkTextStyle.copyWith(fontSize: 16),
                    ),
                    BlocBuilder<SignatureBloc, SignatureState>(
                      builder: (context, state) {
                        if (state is GetAllSignatureSuccess) {
                          final data = state.listEntity;

                          return PopupMenuButton(
                              icon: const Icon(Icons.more_vert),
                              itemBuilder: (context) => data.map((e) {
                                    return PopupMenuItem(
                                      child: SizedBox(
                                        width: 260.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 150.h,
                                                  width: 200.w,
                                                  child: Image.memory(
                                                      Uint8List.fromList(
                                                          e.image)),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                const Divider(
                                                  thickness: 2,
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () => context
                                                    .read<SignatureBloc>()
                                                    .add(FetchDeleteSignature(
                                                        id: e.id)),
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: redColor,
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList());
                        }
                        return PopupMenuButton(
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => []);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Container(
                  height: 220.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: softGreyColor)),
                  child: SizedBox(
                    height: 200.h,
                    width: 300.w,
                    child: SfSignaturePad(
                      key: signaturePadKey,
                      minimumStrokeWidth: 1,
                      maximumStrokeWidth: 3,
                      strokeColor: darkColor,
                      backgroundColor: transparentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 180.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(greenColor)),
                      onPressed: () async {
                        if (jumlahSign != null && jumlahSign! >= 1) {
                          widgetsnackbar(context, 'Sign sudah ada', redColor);
                        } else {
                          final data = await saveSignature();
                          context
                              .read<SignatureBloc>()
                              .add(FetchSaveSignature(image: data));
                        }
                      },
                      child: const Text('Save Signature'),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 180.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(greenColor)),
                      onPressed: () => signaturePadKey.currentState!.clear(),
                      child: const Text('Clear Pad'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
