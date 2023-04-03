import 'package:flutter/material.dart';
import 'package:portfolio/src/core/constants/app_colors.dart';
import 'package:portfolio/src/core/constants/app_text_theme.dart';

class CommonOutlineButton extends StatelessWidget {
  const CommonOutlineButton(
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
      child: OutlinedButton(
          onPressed: voidCallback,
          style: OutlinedButton.styleFrom(
            padding: padding ?? EdgeInsets.zero,
              side: BorderSide(color: backgroundColor ?? AppColors.primaryColor, width: 1.5),
          ),
          child: Text(
            title,
            style: textStyle ??
                AppTextTheme.regularLargeStyle
                    .copyWith(fontWeight: FontWeight.bold),
          )),
    );
  }
}
