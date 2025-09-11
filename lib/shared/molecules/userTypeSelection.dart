import 'package:flutter/material.dart';
import '../Atoms/appButton.dart';
import '../Atoms/appSpacer.dart';

class UserTypeSelection extends StatelessWidget {
  const UserTypeSelection({
    super.key,
    this.providerText = 'Sou prestador',
    this.clientText = 'Sou cliente',
    this.onProviderTap,
    this.onClientTap,
    this.spacing = 16.0,
  });

  final String providerText;
  final String clientText;
  final VoidCallback? onProviderTap;
  final VoidCallback? onClientTap;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: providerText,
          onPressed:
              onProviderTap ?? () => Navigator.pushNamed(context, '/provider'),
          backgroundColor: const Color(0xFFF9DC06),
          textColor: Colors.black,
          isFullWidth: true,
          padding: const EdgeInsets.symmetric(vertical: 16),
          borderRadius: 25.0,
        ),
        AppSpacer(height: spacing),
        AppButton(
          text: clientText,
          onPressed:
              onClientTap ?? () => Navigator.pushNamed(context, '/client'),
          backgroundColor: const Color(0xFFE5E7EB),
          textColor: Colors.black,
          isFullWidth: true,
          padding: const EdgeInsets.symmetric(vertical: 16),
          borderRadius: 25.0,
        ),
      ],
    );
  }
}
