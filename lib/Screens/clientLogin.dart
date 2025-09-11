import 'package:braga_resolve/Widgets/LoginScaffold.dart';
import 'package:flutter/material.dart';
import '../shared/organisms/loginFormFields.dart';

class ClientLogin extends StatefulWidget {
  const ClientLogin({super.key});

  @override
  State<ClientLogin> createState() => _ClientLoginState();
}

class _ClientLoginState extends State<ClientLogin> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      Future.delayed(const Duration(seconds: 1), () {
        if (_loginController.text == 'cliente' &&
            _passwordController.text == 'cliente') {
          Navigator.of(context).pushNamed('/homepage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário e/ou senha incorretos!')),
          );
        }
        if (mounted) setState(() => _isLoading = false);
      });
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
            title: 'Entrar como Cliente',
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
