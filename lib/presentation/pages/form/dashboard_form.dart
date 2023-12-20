import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/presentation/pages/form/daily/list_daily_activity_page.dart';
import 'package:hama_app/presentation/pages/form/form_daily_activity.dart';
import 'package:hama_app/presentation/pages/form/form_index_populasi_hama.dart';
import 'package:hama_app/presentation/pages/form/form_inspeksi_akses_hama.dart';
import 'package:hama_app/presentation/pages/form/pemakaian/form_monitoring_pemakaian.dart';
import 'package:hama_app/presentation/pages/form/pemakaian/list_monitoring_pemakaian_page.dart';
import 'package:hama_app/presentation/pages/form/peralatan/form_monitoring_peralatan.dart';
import 'package:hama_app/presentation/pages/form/list_data_form.dart';
import 'package:hama_app/presentation/pages/form/peralatan/list_monitoring_peralatan.dart';
import 'package:hama_app/presentation/widget/icon_form_widget.dart';

class DashboardFormPage extends StatelessWidget {
  static const routeName = 'dashboard-form';
  static const path = 'dashboard-form';
  final String noOrder;
  const DashboardFormPage({super.key, required this.noOrder});

  @override
  Widget build(BuildContext context) {
    Widget iconHomePage() {
      return Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            IconFormWidget(
              icon: Icons.monitor,
              label: 'Monitoring Peralatan',
              onPressed: () => context.goNamed(
                  ListMonitoringPeralatanPage.routeName,
                  extra: noOrder),
            ),
            IconFormWidget(
              icon: Icons.dvr_outlined,
              label: 'Monitoring Pemakaian',
              onPressed: () => context.goNamed(
                  ListMonitoringPemakaianPage.routeName,
                  extra: noOrder),
            ),
            IconFormWidget(
              icon: Icons.assignment,
              label: 'Daily Activity',
              onPressed: () => context.goNamed(ListDailyActivityPage.routeName,
                  extra: noOrder),
            ),
            IconFormWidget(
              icon: Icons.policy,
              label: 'Inspeksi Akses Hama',
              onPressed: () => context.goNamed(FormInspeksiAksesHama.routeName),
            ),
            IconFormWidget(
              icon: Icons.pest_control,
              label: 'Penghitungan Populasi Hama',
              onPressed: () => context.goNamed(FormIndexPopulasiHama.routeName),
            ),
            IconFormWidget(
              icon: Icons.visibility,
              label: 'Lihat Data Form',
              onPressed: () => context.goNamed(ListDataFormPage.routeName),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Form'),
        backgroundColor: greenColor,
      ),
      body: iconHomePage(),
    );
  }
}
