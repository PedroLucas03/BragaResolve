import 'package:flutter/material.dart';
import '../Molecules/molecules.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    super.key,
    this.title = 'Bem Vindo!',
    this.subtitle =
        'Conectando prestadores de serviços com clientes de forma rápida e eficiente.',
    this.logoHeight = 100.0,
    this.spacing = 10.0,
  });

  final String title;
  final String subtitle;
  final double logoHeight;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        WelcomeHeader(
          title: title,
          subtitle: '', 
          logoHeight: logoHeight,
        ),

        
        DescriptionText(text: subtitle, topSpacing: spacing),
      ],
    );
  }
}