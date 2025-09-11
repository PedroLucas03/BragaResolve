import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}