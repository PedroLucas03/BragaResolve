import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {
  const AppSpacer({super.key, this.width = 0, this.height = 0});

  final double width;
  final double height;

  // Construtor para espaçamento horizontal
  const AppSpacer.horizontal(double width, {super.key})
    : width = width,
      height = 0;

  // Construtor para espaçamento vertical
  const AppSpacer.vertical(double height, {super.key})
    : width = 0,
      height = height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width > 0 ? width : null,
      height: height > 0 ? height : null,
    );
  }
}
