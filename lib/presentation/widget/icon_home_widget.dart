import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/style/style.dart';

class IconHomeWidget extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  final String? label;

  const IconHomeWidget({
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
        height: 200.h,
        width: 200.w,
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
                    height: 75.h,
                    width: 75.w,
                    child: icon != null
                        ? Icon(
                            icon,
                            size: 75,
                          )
                        : const SizedBox(),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    label!,
                    style: darkTextStyle.copyWith(
                        fontSize: 24.sp, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
