import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';

class IconFormWidget extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  final String? label;

  const IconFormWidget({
    super.key,
    this.icon,
    required this.onPressed,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 130.h,
        width: 130.w,
        decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            border: Border.all(width: 3.w, color: greyColor),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: icon != null
                        ? Icon(
                            icon,
                            size: 36,
                          )
                        : const SizedBox(),
                  ),
                ),
                Text(
                  label!,
                  style: darkTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
