import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import 'package:hama_app/common/style/style.dart';

class CircleProgressBarWidget extends StatefulWidget {
  const CircleProgressBarWidget({
    super.key,
  });

  @override
  State<CircleProgressBarWidget> createState() =>
      _CircleProgressBarWidgetState();
}

class _CircleProgressBarWidgetState extends State<CircleProgressBarWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, child) {
        return Transform.rotate(
          angle: animationController.value * 2 * math.pi,
          child: child,
        );
      },
      child: Image.asset(
        'assets/icons/progress_bar.png',
        width: 40.w,
        height: 40.h,
      ),
    );
  }
}

class CircleProgress extends StatelessWidget {
  const CircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.w,
      child: const Center(
        child: CircleProgressBarWidget(),
      ),
    );
  }
}

class LoadingWidget {
  BuildContext context;
  LoadingWidget(this.context);
  Future<dynamic> loadingUtils(BuildContext context) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return const Dialog(
          backgroundColor: transparentColor,
          // insetPadding: const EdgeInsets.symmetric(horizontal: 150),
          elevation: 0,
          // child: CircleProgressBarWidget(),
          child: CircleProgress(),
        );
      },
    );
  }

  void loading(bool isOn) {
    if (isOn) {
      loadingUtils(context);
    }
    if (!isOn) {
      context.pop();
    }
  }
}
