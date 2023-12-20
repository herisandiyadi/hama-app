import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hama_app/common/router/router.dart';
import 'package:hama_app/injection.dart' as di;
import 'package:hama_app/presentation/bloc/absen/absen_bloc.dart';
import 'package:hama_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:hama_app/presentation/bloc/dailiy/daily_bloc.dart';
import 'package:hama_app/presentation/bloc/index_hama/index_hama_bloc.dart';
import 'package:hama_app/presentation/bloc/inspeksi/inspeksi_bloc.dart';
import 'package:hama_app/presentation/bloc/order/order_bloc.dart';
import 'package:hama_app/presentation/bloc/pemakaian/pemakaian_bloc.dart';
import 'package:hama_app/presentation/bloc/peralatan/peralatan_bloc.dart';
import 'package:hama_app/presentation/bloc/personel/personel_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final route = AppRouter.routeNavigation();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.locator<AuthBloc>()),
        BlocProvider(create: (context) => di.locator<OrderBloc>()),
        BlocProvider(create: (context) => di.locator<PersonelBloc>()),
        BlocProvider(create: (context) => di.locator<AbsenBloc>()),
        BlocProvider(create: (context) => di.locator<PeralatanBloc>()),
        BlocProvider(create: (context) => di.locator<PemakaianBloc>()),
        BlocProvider(create: (context) => di.locator<DailyBloc>()),
        BlocProvider(create: (context) => di.locator<InspeksiBloc>()),
        BlocProvider(create: (context) => di.locator<IndexHamaBloc>()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Hama App',
              routerDelegate: route.routerDelegate,
              routeInformationProvider: route.routeInformationProvider,
              routeInformationParser: route.routeInformationParser,
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
            );
          }),
    );
  }
}
