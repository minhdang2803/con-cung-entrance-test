import 'package:concung_entrance_test/view/style/app_color.dart';
import 'package:concung_entrance_test/view/style/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.color = AppColor.primary,
    required this.title,
    this.width,
    this.height,
    this.borderRadius,
    this.onTap,
    this.isLoading = false,
    this.prefixIcon,
    this.isFunctionButton = false,
    this.iconFunction,
    this.fontSize,
    this.elevation = 0,
    this.fontWeight,
    this.suffixIcon,
    this.iconColor = Colors.white,
    this.iconSize,
  });
  final FontWeight? fontWeight;
  final Color? iconColor;
  final double? iconSize;
  final double? fontSize;
  final Color? color;
  final String title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final void Function()? onTap;
  final bool? isLoading;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? iconFunction;
  final bool? isFunctionButton;
  final double? elevation;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 327.w,
      height: widget.height ?? 50.h,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 28.5.r)),
      child: !widget.isFunctionButton!
          ? (widget.isLoading! ? _buildLoading() : _buildNormalButton())
          : (widget.isLoading! ? _buildLoading() : _buildFunctionButton()),
    );
  }

  Widget _buildFunctionButton() {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(widget.elevation!),
          backgroundColor: MaterialStateProperty.all<Color>(widget.color!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 28.5.r),
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [widget.iconFunction!, 5.horizontalSpace, _buildText()],
      ),
    );
  }

  Widget _buildNormalButton() {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(widget.elevation!),
          backgroundColor: MaterialStateProperty.all<Color>(widget.color!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 28.5.r),
          ))),
      child: widget.isLoading!
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : widget.prefixIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.prefixIcon,
                      color: widget.iconColor!,
                      size: widget.iconSize ?? 24.r,
                    ),
                    _buildText()
                  ],
                )
              : widget.suffixIcon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildText(),
                        Icon(
                          widget.suffixIcon,
                          color: widget.iconColor!,
                          size: widget.iconSize ?? 24.r,
                        )
                      ],
                    )
                  : _buildText(),
    );
  }

  Widget _buildLoading() {
    return FittedBox(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: CircularProgressIndicator(
          color: widget.color! == AppColor.primary
              ? Colors.white
              : AppColor.primary,
        ),
      ),
    );
  }

  Text _buildText() {
    return Text(
      widget.title,
      textAlign: TextAlign.center,
      style: AppFont.title.copyWith(
        fontSize: widget.fontSize ?? 15.r,
        color: widget.color == Colors.white ? Colors.black : Colors.white,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}
