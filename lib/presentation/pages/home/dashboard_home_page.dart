import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/presentation/bloc/order/order_bloc.dart';
import 'package:hama_app/presentation/pages/home/list_order_page.dart';
import 'package:hama_app/presentation/widget/icon_home_widget.dart';
import 'package:hama_app/presentation/widget/widget_snackbar.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({super.key});

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController noOrderController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  String fullName = '';
  @override
  void dispose() {
    noOrderController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  void getName() async {
    await CacheUtil.getString(cacheUsername).then(
      (value) {
        setState(() {
          fullName = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget welcome() {
      return Padding(
        padding: EdgeInsets.only(top: 41.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: greyColor,
                      blurRadius: 3.r,
                      offset: const Offset(0.0, 1.0),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 32.h,
                          width: 32.w,
                          child: const CircleAvatar()),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(fullName),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget iconHomePage() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 50.w),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.spaceBetween,
          children: [
            BlocListener<OrderBloc, OrderState>(
              listener: (context, state) {
                if (state is OrderFailed) {
                  context.pop();
                  widgetsnackbar(context, state.message, redColor);
                }
                if (state is OrderSuccess) {
                  context.pop();
                  widgetsnackbar(
                      context, state.orderEntity.message, greenColor);
                }
              },
              child: IconHomeWidget(
                icon: Icons.assignment_add,
                label: 'Buat Order',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Form(
                          key: _formKey,
                          child: AlertDialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.zero,
                            content: Container(
                              height: 400.h,
                              width: 1.sw,
                              padding: const EdgeInsets.all(24),
                              decoration:
                                  const BoxDecoration(color: whiteColor),
                              child: ListView(
                                children: [
                                  Text(
                                    'No Order',
                                    style: darkTextStyle.copyWith(
                                        fontSize: 18.sp, fontWeight: bold),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Masukkan No Order';
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.always,
                                    controller: noOrderController,
                                    decoration: InputDecoration(
                                      labelText: 'No Order',
                                      labelStyle: darkTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Masukkan Nama Pelanggan';
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.always,
                                    controller: clientController,
                                    decoration: InputDecoration(
                                      labelText: 'Nama Pelanggan',
                                      labelStyle: darkTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  SizedBox(
                                    height: 45.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<OrderBloc>().add(
                                            FetchCreateOrder(
                                                noOrder: noOrderController.text,
                                                clientName:
                                                    clientController.text));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          greenColor,
                                        ),
                                      ),
                                      child: Text(
                                        'Save',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            IconHomeWidget(
              icon: Icons.assignment,
              label: 'List Order',
              onPressed: () {
                context.goNamed(
                  ListOrderPage.routeName,
                );
              },
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                greenColor,
                whiteColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                welcome(),
                SizedBox(
                  height: 100.h,
                ),
                iconHomePage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
