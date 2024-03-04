// ignore_for_file: must_be_immutable

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/presentation/pages/home/dashboard_home_page.dart';
import 'package:hama_app/presentation/pages/home/more_page.dart';
import 'package:hama_app/presentation/pages/signature/signature_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homepage';
  static const path = '/homepage';
  int tabIndex;
  HomePage({super.key, this.tabIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> listPage = [const DashboardHomePage(), const MorePage()];

  @override
  void initState() {
    super.initState();
  }

  onBackPressed() async {
    return Alert(
        context: context,
        title: 'Konfirmasi',
        desc: 'Anda yakin ingin keluar dari aplikasi?',
        buttons: [
          DialogButton(
              color: Colors.red,
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => SystemNavigator.pop()),
          DialogButton(
              color: Colors.red,
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => context.pop()),
        ]).show();
  }

  void onTabTapped(int index) {
    setState(() {
      widget.tabIndex = index;
    });
  }

  final listIconMenu = const [
    Icons.home,
    Icons.more_horiz_outlined,
  ];

  final listTextMenu = const ['Beranda', 'Setting'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(),
      child: SafeArea(
        child: Scaffold(
          body: listPage[widget.tabIndex],
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 2,
            tabBuilder: (index, isActive) {
              return Container(
                color: isActive ? greenColor : whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      listIconMenu[index],
                      color: isActive ? whiteColor : darkColor,
                    ),
                    Text(
                      listTextMenu[index],
                      style: isActive
                          ? whiteTextStyle.copyWith()
                          : darkTextStyle.copyWith(),
                    ),
                  ],
                ),
              );
            },
            activeIndex: widget.tabIndex,
            onTap: (index) {
              setState(() {
                widget.tabIndex = index;
              });
            },
            notchSmoothness: NotchSmoothness.sharpEdge,
            gapLocation: GapLocation.center,
          ),
          floatingActionButton: RawMaterialButton(
            elevation: 2.0,
            shape: const CircleBorder(),
            fillColor: whiteColor,
            onPressed: () {
              context.goNamed(SignaturePage.routeName);
            },
            constraints: const BoxConstraints.tightFor(
              width: 75.0,
              height: 75.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.co_present_outlined),
                Text(
                  'E-SIGN',
                  style: darkTextStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        ),
      ),
    );
  }
}
