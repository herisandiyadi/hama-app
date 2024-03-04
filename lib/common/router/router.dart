import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/presentation/pages/absen/absen_page.dart';
import 'package:hama_app/presentation/pages/absen/detail_personal_absen.dart';
import 'package:hama_app/presentation/pages/auth/login_page.dart';
import 'package:hama_app/presentation/pages/content/order_page.dart';
import 'package:hama_app/presentation/pages/form/daily/list_daily_activity_page.dart';
import 'package:hama_app/presentation/pages/form/dashboard_form.dart';
import 'package:hama_app/presentation/pages/form/daily/form_daily_activity.dart';
import 'package:hama_app/presentation/pages/form/index/form_index_populasi_hama.dart';
import 'package:hama_app/presentation/pages/form/index/list_index_hama_page.dart';
import 'package:hama_app/presentation/pages/form/inspeksi/form_inspeksi_akses_hama.dart';
import 'package:hama_app/presentation/pages/form/inspeksi/list_inspeksi_hama_page.dart';
import 'package:hama_app/presentation/pages/form/pemakaian/form_monitoring_pemakaian.dart';
import 'package:hama_app/presentation/pages/form/pemakaian/list_monitoring_pemakaian_page.dart';
import 'package:hama_app/presentation/pages/form/peralatan/form_monitoring_peralatan.dart';
import 'package:hama_app/presentation/pages/form/peralatan/list_monitoring_peralatan.dart';
import 'package:hama_app/presentation/pages/form/report/report_page.dart';
import 'package:hama_app/presentation/pages/home/list_order_page.dart';
import 'package:hama_app/presentation/pages/home_page.dart';
import 'package:hama_app/presentation/pages/personel/personel_page.dart';
import 'package:hama_app/presentation/pages/signature/signature_page.dart';
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
                    path: SignaturePage.path,
                    name: SignaturePage.routeName,
                    builder: (context, state) {
                      return SignaturePage();
                    }),
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
                            final extras = state.extra as Map<String, dynamic>;
                            return OrderPage(
                              noOrder: extras['noOrder'],
                            );
                          },
                          routes: [
                            GoRoute(
                                path: PersonelPage.path,
                                name: PersonelPage.routeName,
                                builder: (context, state) {
                                  final extras =
                                      state.extra as Map<String, dynamic>;
                                  return PersonelPage(
                                    noOrder: extras['noOrder'],
                                  );
                                }),
                            GoRoute(
                                path: AbsenPage.path,
                                name: AbsenPage.routeName,
                                builder: (context, state) {
                                  final extras =
                                      state.extra as Map<String, dynamic>;
                                  return AbsenPage(
                                    noOrder: extras['noOrder'],
                                  );
                                },
                                routes: [
                                  GoRoute(
                                      path: DetailPersonalAbsen.path,
                                      name: DetailPersonalAbsen.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return DetailPersonalAbsen(
                                          noOrder: extras['noOrder'],
                                          id: extras['id'],
                                          name: extras['name'],
                                        );
                                      }),
                                ]),
                            GoRoute(
                                path: DashboardFormPage.path,
                                name: DashboardFormPage.routeName,
                                builder: (context, state) {
                                  final extras =
                                      state.extra as Map<String, dynamic>;

                                  return DashboardFormPage(
                                    noOrder: extras['noOrder'],
                                  );
                                },
                                routes: [
                                  GoRoute(
                                      path: ListMonitoringPeralatanPage.path,
                                      name:
                                          ListMonitoringPeralatanPage.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return ListMonitoringPeralatanPage(
                                            noOrder: extras['noOrder']);
                                      }),
                                  GoRoute(
                                      path: ListMonitoringPemakaianPage.path,
                                      name:
                                          ListMonitoringPemakaianPage.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return ListMonitoringPemakaianPage(
                                            noOrder: extras['noOrder']);
                                      }),
                                  GoRoute(
                                      path: ListDailyActivityPage.path,
                                      name: ListDailyActivityPage.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return ListDailyActivityPage(
                                            noOrder: extras['noOrder']);
                                      }),
                                  GoRoute(
                                      path: ListInspeksiHamaPage.path,
                                      name: ListInspeksiHamaPage.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return ListInspeksiHamaPage(
                                            noOrder: extras['noOrder']);
                                      }),
                                  GoRoute(
                                      path: ListIndexHamaPage.path,
                                      name: ListIndexHamaPage.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return ListIndexHamaPage(
                                            noOrder: extras['noOrder']);
                                      }),
                                  GoRoute(
                                      path: FormMonitoringPeralatan.path,
                                      name: FormMonitoringPeralatan.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return FormMonitoringPeralatan(
                                          noOrder: extras['noOrder'],
                                        );
                                      }),
                                  GoRoute(
                                      path: FormMonitoringPemakaian.path,
                                      name: FormMonitoringPemakaian.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;
                                        return FormMonitoringPemakaian(
                                          noOrder: extras['noOrder'],
                                        );
                                      }),
                                  GoRoute(
                                      path: FormDailyActivity.path,
                                      name: FormDailyActivity.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;
                                        return FormDailyActivity(
                                          noOrder: extras['noOrder'],
                                        );
                                      }),
                                  GoRoute(
                                      path: FormInspeksiAksesHama.path,
                                      name: FormInspeksiAksesHama.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;

                                        return FormInspeksiAksesHama(
                                          noOrder: extras['noOrder'],
                                        );
                                      }),
                                  GoRoute(
                                      path: FormIndexPopulasiHama.path,
                                      name: FormIndexPopulasiHama.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;
                                        return FormIndexPopulasiHama(
                                          noOrder: extras['noOrder'],
                                        );
                                      }),
                                  GoRoute(
                                      path: ReportPage.path,
                                      name: ReportPage.routeName,
                                      builder: (context, state) {
                                        final extras =
                                            state.extra as Map<String, dynamic>;
                                        return ReportPage(
                                          noOrder: extras['noOrder'],
                                        );
                                      }),
                                ]),
                          ]),
                    ]),
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
