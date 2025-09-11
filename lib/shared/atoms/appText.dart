import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.textStyle,
    this.overflow,
    this.isBold = false,
  });

  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textStyle?.color ?? Colors.black,
        fontSize: textStyle?.fontSize ?? 16,
        fontWeight: isBold
            ? FontWeight.bold
            : (textStyle?.fontWeight ?? FontWeight.normal),
      ).merge(textStyle),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
