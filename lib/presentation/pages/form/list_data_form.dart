// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import 'package:hama_app/common/style/style.dart';

class ListDataFormPage extends StatefulWidget {
  static const routeName = 'list-data-form';
  static const path = 'list-data-form';

  const ListDataFormPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListDataFormPage> createState() => _ListDataFormPageState();
}

class _ListDataFormPageState extends State<ListDataFormPage> {
  List<bool> valueState = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('List Data Form'),
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
              height: 1.sh - 150.h,
              width: 1.sw,
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
          ],
        ),
      ),
    ));
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 100),
      _getTitleItemWidget('Tanggal', 100),
      _getTitleItemWidget('Action', 100),
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
      children: [
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(TextUtils().dateFormatId(DateTime.now())),
        ),
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ),
      ],
    );
  }
}
