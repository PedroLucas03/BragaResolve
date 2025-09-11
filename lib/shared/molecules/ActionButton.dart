import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFF2DB0D),
    this.textColor = Colors.black,
    this.isLoading = false,
    this.width,
    this.height = 48,
    this.icon,
    this.iconSize = 16,
    this.borderRadius = 25.0,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final double? width;
  final double height;
  final IconData? icon;
  final double iconSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}