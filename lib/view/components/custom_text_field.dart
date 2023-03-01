import 'package:concung_entrance_test/view/style/app_color.dart';
import 'package:concung_entrance_test/view/style/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.height,
    this.width,
    this.suffiixIcon,
    this.validator,
  });
  final String title;
  final String hintText;
  final TextEditingController controller;
  bool? isPassword;
  final double? height;
  final double? width;
  final IconData? suffiixIcon;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 100.h,
      width: widget.width ?? 324.01.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          5.verticalSpace,
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      widget.title,
      style: AppFont.title.copyWith(color: AppColor.textLabel),
    );
  }

  Widget _buildForm(BuildContext context) {
    bool password = widget.isPassword!;
    return TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      controller: widget.controller,
      obscureText: password,
      style: AppFont.title.copyWith(color: AppColor.textLabel),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20.r),
        hintText: widget.hintText,
        hintStyle: AppFont.title.copyWith(color: AppColor.hintText),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.borderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.borderColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Colors.red)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Colors.red)),
        suffixIcon: widget.suffiixIcon != null
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: () =>
                    setState(() => widget.isPassword = !widget.isPassword!),
                icon: Icon(
                  widget.suffiixIcon,
                  color: AppColor.hintText,
                ),
              )
            : null,
      ),
      validator: widget.validator,
    );
  }
}
