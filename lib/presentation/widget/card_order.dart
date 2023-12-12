// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hama_app/common/style/style.dart';

class CardOrder extends StatelessWidget {
  final String noOrder;
  final String personel;
  final Function()? onPressed;

  const CardOrder({
    Key? key,
    required this.noOrder,
    required this.personel,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 100.h,
            width: 350.w,
            decoration: BoxDecoration(
              color: softGreyColor,
              borderRadius: BorderRadius.circular(23.r),
              boxShadow: [
                BoxShadow(
                  color: greyColor,
                  blurRadius: 3.r,
                  offset: const Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Order : $noOrder',
                    style: darkTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Jumlah Personel : $personel orang',
                    style: darkTextStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
