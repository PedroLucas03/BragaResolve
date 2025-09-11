import 'package:flutter/material.dart';
import '../Atoms/appText.dart';
import '../Atoms/appSpacer.dart';

/// Molécula para exibir texto descritivo com padding
/// Combina AppText + AppSpacer para layout consistente
class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0),
    this.topSpacing = 10.0,
    this.textStyle = const TextStyle(
      fontSize: 15,
      color: Colors.grey,
      height: 1.4,
    ),
  });

  final String text;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final double topSpacing;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacer.vertical(topSpacing),
        Padding(
          padding: padding,
          child: AppText(
            text: text,
            textStyle: textStyle.copyWith(color: textStyle.color),
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
