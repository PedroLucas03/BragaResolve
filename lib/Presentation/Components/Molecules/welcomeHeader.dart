import 'package:flutter/material.dart';
import '../Atoms/appLogo.dart';
import '../Atoms/appText.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    super.key,
    this.logoPath = 'assets/images/logo.png',
    this.logoHeight = 100.0,
    this.title = 'Bem Vindo!',
    this.subtitle =
        'Conectando prestadores de serviços com clientes de forma rápida e eficiente.',
    this.onLogoTap,
  });

  final String logoPath;
  final double logoHeight;
  final String title;
  final String subtitle;
  final VoidCallback? onLogoTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLogo(imagePath: logoPath, height: logoHeight, onTap: onLogoTap),
        const SizedBox(height: 32),
        AppText(
          text: title,
          textStyle: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        AppText(
          text: subtitle,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }
}
