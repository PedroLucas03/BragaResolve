import 'package:flutter/material.dart';
import '../Atoms/appText.dart';

class ActionLink extends StatelessWidget {
  const ActionLink({
    super.key,
    required this.text,
    required this.actionText,
    required this.onActionTap,
    this.textColor = Colors.black,
    this.actionColor = Colors.black,
    this.fontSize = 12,
  });

  final String text;
  final String actionText;
  final VoidCallback onActionTap;
  final Color textColor;
  final Color actionColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: text,
          textStyle: TextStyle(fontSize: fontSize, color: textColor),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: onActionTap,
          child: AppText(
            text: actionText,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: actionColor,
            ),
          ),
        ),
      ],
    );
  }
}