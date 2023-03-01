import 'dart:io';

import 'package:concung_entrance_test/utils/extension.dart';
import 'package:concung_entrance_test/utils/widget_utils.dart';
import 'package:concung_entrance_test/view/routes/route_name.dart';
import 'package:concung_entrance_test/view/style/app_color.dart';
import 'package:concung_entrance_test/view/style/app_font.dart';
import 'package:concung_entrance_test/view/components/components.dart';
import 'package:concung_entrance_test/view/components/custom_text_field.dart';
import 'package:concung_entrance_test/view_model/login_provider.dart';
import 'package:concung_entrance_test/view_model/register_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final controller = TextEditingController();
    return Stack(
      children: [
        _buildBackground(context),
        _buildUI(context),
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: Platform.isAndroid
              ? EdgeInsets.symmetric(horizontal: 26.r)
              : EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildBackButton(context),
              40.verticalSpace,
              _buildTitle(context),
              30.verticalSpace,
              _buildForm(context),
              15.verticalSpace,
              _buildForgetText(context),
              20.verticalSpace,
              _buildLoginButton(context),
              20.verticalSpace,
              _buildSignUpButton(context),
              40.verticalSpace,
              _buildDivider(context),
              20.verticalSpace,
              _buildLoginOption(context),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 324.01.w,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.5), //(x,y)
                blurRadius: 1.0,
              ),
            ],
          ),
          width: 38.r,
          height: 38.r,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18.r,
              weight: 2,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _buildLoginOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          title: "FACEBOOK",
          fontSize: 13.r,
          width: 147.r,
          isFunctionButton: true,
          color: Colors.white,
          elevation: 1,
          iconFunction: SvgPicture.asset("assets/facebook.svg"),
          onTap: () {},
        ),
        CustomButton(
          title: "GOOGLE",
          fontSize: 13.r,
          width: 147.r,
          isFunctionButton: true,
          color: Colors.white,
          elevation: 1,
          iconFunction: SvgPicture.asset("assets/google.svg"),
          onTap: () {},
        )
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Flexible(
            child: Divider(color: AppColor.greyColor, thickness: 1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Text(
              "Sign in with",
              style: AppFont.body.copyWith(color: AppColor.darkGray),
            ),
          ),
          const Flexible(
            child: Divider(color: AppColor.greyColor, thickness: 1),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    final state = context.watch<RegisterState>();
    state.when(
      initial: () {},
      done: () {
        WidgetUtil.showToast("Successfully register!");
      },
      error: (errorMessage) {
        WidgetUtil.showToast(errorMessage);
      },
      loading: () {},
    );
    return Text.rich(
      TextSpan(
        text: "Don't have an account?",
        style: AppFont.body.copyWith(color: AppColor.darkGray),
        children: [
          TextSpan(
            text: " Sign up",
            style: AppFont.body.copyWith(color: AppColor.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                context.read<RegisterProvider>().register();
              },
          )
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    final button = CustomButton(
      title: "LOGIN",
      width: 248.r,
      height: 52.r,
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          await context
              .read<LoginProvider>()
              .login(_email.text, _password.text);
        }
      },
      isLoading: false,
    );
    return StateNotifierBuilder(
      stateNotifier: context.read<LoginProvider>(),
      builder: (context, state, child) {
        if (state.loginStatus == LoginStatus.done) {
          context.read<LoginProvider>().setInitial();
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pushReplacementNamed(context, RouteName.main);
          });
        } else if (state.loginStatus == LoginStatus.fail) {
          WidgetUtil.showToast(state.errorMessage!);
        } else if (state.loginStatus == LoginStatus.loading) {
          return CustomButton(
            title: "LOGIN",
            width: 248.r,
            height: 52.r,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                await context
                    .read<LoginProvider>()
                    .login(_email.text, _password.text);
              }
            },
            isLoading: true,
          );
        }
        return button;
      },
      child: button,
    );
  }

  Widget _buildForgetText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "Forgot password!",
        textAlign: TextAlign.center,
        style: AppFont.body.copyWith(
          color: AppColor.primary,
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              title: "E-mail",
              controller: _email,
              hintText: "Your Email and Password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email cannot be blank!";
                } else if (!value.isValidEmail()) {
                  WidgetUtil.showToast("Email is invalid!");
                  return "Email is invalid";
                }
                return null;
              },
            ),
            CustomTextField(
              title: "Password",
              controller: _password,
              hintText: "Password",
              isPassword: true,
              suffiixIcon: Icons.remove_red_eye,
            )
          ],
        ));
  }

  Widget _buildTitle(BuildContext context) {
    return SizedBox(
      width: 324.01.w,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Login",
          style: AppFont.headline
              .copyWith(fontWeight: FontWeight.bold, fontSize: 36.41.r),
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Positioned.fill(
      child: SvgPicture.asset(
        "assets/background.svg",
        fit: BoxFit.contain,
      ),
    );
  }
}
