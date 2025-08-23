import 'package:braga_resolve/Widgets/LoginScaffold.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/logo.png', height: 100),
          Column(
            children: [
              const Text(
                'Bem Vindo!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Conectando prestadores de serviços com clientes de forma rápida e eficiente.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              optionButton(
                context,
                'Sou prestador',
                Color(0xFFF9DC06),
                '/provider',
              ),
              const SizedBox(height: 16),
              optionButton(
                context,
                'Sou cliente',
                Color(0xFFE5E7EB),
                '/client',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget optionButton(
    BuildContext context,
    String buttonText,
    Color buttonColor,
    String navigateTo,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, navigateTo);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
