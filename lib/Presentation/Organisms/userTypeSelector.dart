import 'package:flutter/material.dart';
import '../Molecules/molecules.dart';

/// Organismo que gerencia a seleção de tipo de usuário
/// Combina SectionHeader e UserTypeSelection (2 moléculas diferentes)
class UserTypeSelector extends StatelessWidget {
  const UserTypeSelector({
    super.key,
    this.onProviderPressed,
    this.onClientPressed,
    this.providerText = 'Sou prestador',
    this.clientText = 'Sou cliente',
    this.spacing = 16.0,
    this.providerIcon,
    this.clientIcon,
  });

  final VoidCallback? onProviderPressed;
  final VoidCallback? onClientPressed;
  final String providerText;
  final String clientText;
  final double spacing;
  final IconData? providerIcon;
  final IconData? clientIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        SectionHeader(
          title: 'Escolha seu perfil',
          subtitle: 'Como você gostaria de usar nosso app?',
        ),

        
        UserTypeSelection(
          onProviderTap:
              onProviderPressed ??
              () {
                Navigator.pushNamed(context, '/provider');
              },
          onClientTap:
              onClientPressed ??
              () {
                Navigator.pushNamed(context, '/client');
              },
          providerText: providerText,
          clientText: clientText,
          spacing: spacing,
        ),
      ],
    );
  }
}