import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height = 1.0,
    this.color,
    this.thickness = 1.0,
  });

  final double height;
  final Color? color;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? Colors.grey[300],
    );
  }
}