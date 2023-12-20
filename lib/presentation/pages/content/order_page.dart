import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/presentation/pages/absen/absen_page.dart';
import 'package:hama_app/presentation/pages/form/dashboard_form.dart';
import 'package:hama_app/presentation/pages/personel/personel_page.dart';
import 'package:hama_app/presentation/widget/icon_home_widget.dart';

class OrderPage extends StatelessWidget {
  static const routeName = 'order-page';
  static const path = 'order-page';
  final String noOrder;
  const OrderPage({super.key, required this.noOrder});

  @override
  Widget build(BuildContext context) {
    Widget iconHomePage() {
      return Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            IconHomeWidget(
              icon: Icons.assignment_add,
              label: 'Personel',
              onPressed: () => context
                  .goNamed(PersonelPage.routeName, extra: {'noOrder': noOrder}),
            ),
            IconHomeWidget(
              icon: Icons.assignment,
              label: 'Absen',
              onPressed: () => context
                  .goNamed(AbsenPage.routeName, extra: {'noOrder': noOrder}),
            ),
            IconHomeWidget(
              icon: Icons.assignment,
              label: 'Form',
              onPressed: () => context.goNamed(DashboardFormPage.routeName,
                  extra: {'noOrder': noOrder}),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('No Order : $noOrder'),
          backgroundColor: greenColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: iconHomePage(),
        ),
      ),
    );
  }
}
