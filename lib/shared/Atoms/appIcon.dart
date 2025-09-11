import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.icon,
    this.size = 24.0,
    this.color = Colors.black,
  });

  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}