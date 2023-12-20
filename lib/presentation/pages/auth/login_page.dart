import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/domain/entities/login_request.dart';
import 'package:hama_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:hama_app/presentation/pages/home_page.dart';
import 'package:hama_app/presentation/widget/widget_loading_circle.dart';
import 'package:hama_app/presentation/widget/widget_snackbar.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  static const path = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHide = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool validate() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Center(
              child: Image.asset(
                'assets/logos/bw-hama-logo.png',
                height: 250.h,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: whiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ).animate().fadeIn().scale().move(delay: 300.ms, duration: 600.ms),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: isHide,
                validator: (value) {
                  if (value!.length < 8) {
                    return 'Password at least 8 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                      icon: isHide
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  fillColor: whiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ).animate().fadeIn().scale().move(delay: 300.ms, duration: 600.ms),
            SizedBox(
              height: 20.h,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  LoadingWidget(context).loading(true);
                }
                if (state is AuthSuccess) {
                  LoadingWidget(context).loading(false);

                  context.goNamed(HomePage.routeName);
                }
                if (state is AuthFailed) {
                  LoadingWidget(context).loading(false);

                  widgetsnackbar(context, state.message, redColor);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 55.h,
                  width: 1.sw,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        greenColor,
                      ),
                    ),
                    onPressed: () {
                      final loginRequest = LoginRequest(
                          email: emailController.text,
                          password: passwordController.text);
                      context
                          .read<AuthBloc>()
                          .add(FetchLogin(loginRequest: loginRequest));
                    },
                    child: Text("Login".toUpperCase(),
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold)),
                  ),
                ),
              ),
            ).animate().fadeIn().scale().move(delay: 300.ms, duration: 600.ms),
            SizedBox(
              height: 150.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Powered By ',
                    style: darkTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Image.asset(
                    'assets/logos/fc_logos.png',
                    width: 100.w,
                  ),
                ],
              ),
            ).animate().fadeIn().scale().move(delay: 300.ms, duration: 600.ms),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
    );
  }
}
