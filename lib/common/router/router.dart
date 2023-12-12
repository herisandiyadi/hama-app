import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/presentation/pages/absen/absen_page.dart';
import 'package:hama_app/presentation/pages/auth/login_page.dart';
import 'package:hama_app/presentation/pages/content/order_page.dart';
import 'package:hama_app/presentation/pages/form/dashboard_form.dart';
import 'package:hama_app/presentation/pages/form/form_daily_activity.dart';
import 'package:hama_app/presentation/pages/form/form_index_populasi_hama.dart';
import 'package:hama_app/presentation/pages/form/form_inspeksi_akses_hama.dart';
import 'package:hama_app/presentation/pages/form/form_monitoring_pemakaian.dart';
import 'package:hama_app/presentation/pages/form/form_monitoring_peralatan.dart';
import 'package:hama_app/presentation/pages/form/list_data_form.dart';
import 'package:hama_app/presentation/pages/home/list_order_page.dart';
import 'package:hama_app/presentation/pages/home_page.dart';
import 'package:hama_app/presentation/pages/personel/personel_page.dart';
import 'package:hama_app/presentation/pages/signature/signature_document.dart';
import 'package:hama_app/presentation/pages/splash_screen_page.dart';

class AppRouter {
  static GoRouter routeNavigation() {
    GoRouter router = GoRouter(
        navigatorKey: GlobalKey<NavigatorState>(),
        routerNeglect: false,
        initialLocation: '/splashscreen',
        observers: [routeObserver],
        errorPageBuilder: (context, state) {
          return const MaterialPage(
            child: Scaffold(
              body: Center(
                child: Text('Page Error'),
              ),
            ),
          );
        },
        debugLogDiagnostics: true,
        redirect: (context, state) {
          print(state.fullPath);
        },
        routes: [
          GoRoute(
              path: HomePage.path,
              name: HomePage.routeName,
              builder: (context, state) {
                return HomePage();
              },
              routes: [
                GoRoute(
                    path: ListOrderPage.path,
                    name: ListOrderPage.routeName,
                    builder: (context, state) {
                      return ListOrderPage();
                    },
                    routes: [
                      GoRoute(
                          path: OrderPage.path,
                          name: OrderPage.routeName,
                          builder: (context, state) {
                            final extras = state.extra as String;
                            return OrderPage(
                              noOrder: extras,
                            );
                          },
                          routes: [
                            GoRoute(
                                path: PersonelPage.path,
                                name: PersonelPage.routeName,
                                builder: (context, state) {
                                  final extras = state.extra as String;
                                  return PersonelPage(
                                    noOrder: extras,
                                  );
                                }),
                            GoRoute(
                                path: AbsenPage.path,
                                name: AbsenPage.routeName,
                                builder: (context, state) {
                                  final extras = state.extra as String;
                                  return AbsenPage(
                                    noOrder: extras,
                                  );
                                }),
                            GoRoute(
                                path: DashboardFormPage.path,
                                name: DashboardFormPage.routeName,
                                builder: (context, state) {
                                  final extras = state.extra as String;
                                  return DashboardFormPage(
                                    noOrder: extras,
                                  );
                                },
                                routes: [
                                  GoRoute(
                                      path: FormMonitoringPeralatan.path,
                                      name: FormMonitoringPeralatan.routeName,
                                      builder: (context, state) {
                                        return FormMonitoringPeralatan();
                                      }),
                                  GoRoute(
                                      path: FormMonitoringPemakaian.path,
                                      name: FormMonitoringPemakaian.routeName,
                                      builder: (context, state) {
                                        return FormMonitoringPemakaian();
                                      }),
                                  GoRoute(
                                      path: FormDailyActivity.path,
                                      name: FormDailyActivity.routeName,
                                      builder: (context, state) {
                                        return FormDailyActivity();
                                      }),
                                  GoRoute(
                                      path: FormInspeksiAksesHama.path,
                                      name: FormInspeksiAksesHama.routeName,
                                      builder: (context, state) {
                                        return FormInspeksiAksesHama();
                                      }),
                                  GoRoute(
                                      path: FormIndexPopulasiHama.path,
                                      name: FormIndexPopulasiHama.routeName,
                                      builder: (context, state) {
                                        return FormIndexPopulasiHama();
                                      }),
                                  GoRoute(
                                      path: ListDataFormPage.path,
                                      name: ListDataFormPage.routeName,
                                      builder: (context, state) {
                                        return ListDataFormPage();
                                      }),
                                ]),
                          ]),
                    ]),
                GoRoute(
                    path: CreatePdfWidget.path,
                    name: CreatePdfWidget.routeName,
                    builder: (context, state) {
                      return CreatePdfWidget();
                    }),
              ]),
          GoRoute(
            path: LoginPage.path,
            name: LoginPage.routeName,
            builder: (context, state) {
              return LoginPage();
            },
            redirect: (context, state) async {
              final isLogs = await CacheUtil.getBoolean(cacheLogin);
              if (isLogs != null && isLogs) {
                return HomePage.path;
              }
            },
          ),
          GoRoute(
              path: SplashScreen.path,
              name: SplashScreen.routeName,
              builder: (context, state) {
                return SplashScreen();
              }),
        ]);
    return router;
  }
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
