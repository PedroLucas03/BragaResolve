import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/LoginScaffold.dart';
import '../Components/Organisms/loginFormFields.dart';

class ProviderLogin extends StatefulWidget {
  const ProviderLogin({super.key});

  @override
  State<ProviderLogin> createState() => _ProviderLoginState();
}

class _ProviderLoginState extends State<ProviderLogin> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Tenta fazer login com o e-mail e senha cadastrados no Firebase
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (mounted) {
          Navigator.of(context).pushNamed('/homepage');
        }
      } on FirebaseAuthException catch (e) {
        String message = 'Erro ao fazer login.';

        if (e.code == 'user-not-found') {
          message = 'Usuário não encontrado.';
        } else if (e.code == 'wrong-password') {
          message = 'Senha incorreta.';
        } else if (e.code == 'invalid-email') {
          message = 'E-mail inválido.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      appBarBuilder: (context) => AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset('assets/images/logo.png', height: 48),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: LoginFormFields(
            formKey: _formKey,
            loginController: _loginController,
            passwordController: _passwordController,
            onLogin: _handleLogin,
            isLoading: _isLoading,
            title: 'Entrar como Prestador',
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
