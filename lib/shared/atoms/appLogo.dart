import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.onTap,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget logoWidget = Image.asset(
      imagePath,
      height: height ?? 100.0,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: height ?? 100.0,
          width: width ?? 100.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Icon(Icons.image_not_supported, color: Colors.grey),
        );
      },
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: logoWidget);
    }

    return logoWidget;
  }
}
