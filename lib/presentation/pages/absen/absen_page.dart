// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import 'package:hama_app/common/style/style.dart';

class AbsenPage extends StatefulWidget {
  static const routeName = 'absen';
  static const path = 'absen';
  final String noOrder;
  const AbsenPage({
    Key? key,
    required this.noOrder,
  }) : super(key: key);

  @override
  State<AbsenPage> createState() => _AbsenPageState();
}

class _AbsenPageState extends State<AbsenPage> {
  List<bool> valueState = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Absen'),
        backgroundColor: greenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 1.sh - 260.h,
              width: 360.w,
              child: HorizontalDataTable(
                leftHandSideColumnWidth: 100,
                rightHandSideColumnWidth: 200,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                isFixedFooter: true,
                footerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: 10,
                rowSeparatorWidget: const Divider(
                  color: Colors.black38,
                  height: 1.0,
                  thickness: 0.0,
                ),
                leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
                rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
                itemExtent: 55,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 55.h,
                  width: 150.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(greenColor)),
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 100),
      _getTitleItemWidget('Absen', 100),
      // _getTitleItemWidget('Phone', 200),
      // _getTitleItemWidget('Register', 100),
      // _getTitleItemWidget('Termination', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 100,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: const Text('name'),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 200,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: AnimatedToggleSwitch<bool>.dual(
            current: valueState[index],
            first: false,
            second: true,
            spacing: 50.0,
            style: const ToggleStyle(
              borderColor: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            borderWidth: 5.0,
            height: 55,
            onChanged: (b) {
              setState(() {
                valueState[index] = b;
              });
            },
            styleBuilder: (b) =>
                ToggleStyle(indicatorColor: b ? Colors.red : Colors.green),
            iconBuilder: (value) => value
                ? const Icon(Icons.coronavirus_rounded)
                : const Icon(Icons.tag_faces_rounded),
            textBuilder: (value) => value
                ? const Center(child: Text('Tidak Hadir'))
                : const Center(child: Text('Hadir')),
          ),
        ),

        // ),
      ],
    );
  }
}
