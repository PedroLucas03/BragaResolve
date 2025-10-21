import 'package:flutter/material.dart';
import '../Molecules/loginField.dart';
import '../Molecules/actionButton.dart';
import '../Molecules/socialLoginButton.dart';
import '../Molecules/sectionDivider.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    super.key,
    required this.loginController,
    required this.passwordController,
    required this.onLogin,
    required this.formKey,
    this.isLoading = false,
    this.title = 'Entrar como Cliente',
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;
  final GlobalKey<FormState> formKey;
  final bool isLoading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginField(
                controller: loginController,
                icon: Icons.person,
                hintText: 'Login',
              ),
              const SizedBox(height: 16),
              LoginField(
                controller: passwordController,
                icon: Icons.lock,
                hintText: 'Senha',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'A senha deve conter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
            child: const Text(
              'Esqueceu a senha?',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 24),
        ActionButton(
          text: 'Entrar',
          onPressed: isLoading ? null : onLogin,
          isLoading: isLoading,
        ),
        const SectionDivider(text: 'Ou entrar com'),
        SocialLoginButton(
          text: 'Entrar com Google',
          iconPath: 'assets/images/google_logo.png',
          onPressed: () {},
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Não tem conta?", style: TextStyle(fontSize: 12)),
            const SizedBox(width: 12),
            InkWell(
              onTap: () {},
              child: const Text(
                'Criar conta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
