import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:hama_app/presentation/pages/auth/login_page.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              greenColor,
              whiteColor,
              whiteColor,
              greenColor,
            ],
          ),
        ),
        height: 120.h,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 30.w, top: 21.h, bottom: 21.h, right: 16.w),
              child: SizedBox(
                height: 56.h,
                width: 56.w,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  child: Icon(
                    Icons.person,
                    size: 35.h,
                    color: greyColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name',
                    maxLines: 2,
                    style: whiteTextStyle.copyWith(
                        fontSize: 18.sp, fontWeight: bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Column(
      children: [
        header(),
        SizedBox(
          height: 300.h,
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              context.goNamed(LoginPage.routeName);
            }
          },
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(const FetchLogout());
            },
            child: const Text('Logout'),
          ),
        ),
      ],
    );
  }
}
