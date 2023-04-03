import 'package:flutter/material.dart';
import 'package:portfolio/src/core/constants/app_colors.dart';
import 'package:portfolio/src/core/constants/app_text_theme.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key,
      required this.voidCallback,
      required this.title,
      this.textStyle,
      this.backgroundColor,
      this.padding,
      this.width})
      : super(key: key);

  final VoidCallback voidCallback;
  final String title;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      child: ElevatedButton(
          onPressed: voidCallback,
          style: ElevatedButton.styleFrom(
              padding: padding ?? EdgeInsets.zero,
              backgroundColor: backgroundColor ?? AppColors.primaryColor),
          child: Text(
            title,
            style: textStyle ??
                AppTextTheme.regularLargeStyle
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
