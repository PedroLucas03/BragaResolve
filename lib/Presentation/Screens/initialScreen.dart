import 'package:flutter/material.dart';
import '../Widgets/LoginScaffold.dart';
import '../Organisms/organisms.dart';

/// Tela inicial do aplicativo usando atomic design
class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Organismo 1: Seção de boas-vindas
          WelcomeSection(
            title: 'Bem Vindo!',
            subtitle:
                'Conectando prestadores de serviços com clientes de forma rápida e eficiente.',
          ),

          const SizedBox(height: 40), // Espaçamento controlado
          // Organismo 2: Seletor de tipo de usuário
          UserTypeSelector(
            providerText: 'Sou prestador',
            clientText: 'Sou cliente',
            providerIcon: Icons.work,
            clientIcon: Icons.person,
            onProviderPressed: () {
              Navigator.pushNamed(context, '/provider');
            },
            onClientPressed: () {
              Navigator.pushNamed(context, '/client');
            },
          ),
        ],
      ),
    );
  }
}
