import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/LoginScaffold.dart';
import '../Components/Organisms/loginFormFields.dart';

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

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
   
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final user = userCredential.user;

        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('✅ Bem-vindo, ${user.email}!')),
          );

          // Navega para a home
          Navigator.of(context).pushReplacementNamed('/homepage');
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
          SnackBar(content: Text('❌ $message')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Erro inesperado: $e')),
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
