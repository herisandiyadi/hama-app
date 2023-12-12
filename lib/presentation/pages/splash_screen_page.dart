import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/presentation/pages/auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splashscreen';
  static const path = '/splashscreen';
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    super.initState();

    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 1);

    timer = Timer(duration, () => context.replaceNamed(LoginPage.routeName));
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.h,
              ),
              Image.asset(
                'assets/logos/hama-app-logo.png',
                width: 300.w,
              ),
              Text(
                'HAMA APP',
                style:
                    whiteTextStyle.copyWith(fontSize: 36.sp, fontWeight: bold),
              ),
              SizedBox(
                height: 200.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered By ',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                    Image.asset(
                      'assets/logos/logo-sucofindo.png',
                      width: 100.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
