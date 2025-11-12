import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Data/repositories/auth_repository_impl.dart';
import '../../Domain/usecases/sign_up_usecase.dart';
import '../Widgets/LoginScaffold.dart';
import '../Components/Molecules/loginField.dart';
import '../Components/Molecules/ActionButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientSignup extends StatefulWidget {
  const ClientSignup({super.key});

  @override
  State<ClientSignup> createState() => _ClientSignupState();
}

class _ClientSignupState extends State<ClientSignup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  final _signUpUseCase = SignUpUseCase(AuthRepositoryImpl());

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Cria usuário no Firebase Auth
        final user = await _signUpUseCase(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _nameController.text.trim(),
        );

        // Salva dados básicos no Firestore
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('clientes')
              .doc(user.uid)
              .set({
            'nome': _nameController.text.trim(),
            'email': _emailController.text.trim(),
            'criadoEm': FieldValue.serverTimestamp(),
          });

          // 🔹 Mostra sucesso
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Cadastro realizado com sucesso!'),
              backgroundColor: Colors.green,
            ),
          );

          // 🔹 Limpa os campos
          _formKey.currentState!.reset();
          _nameController.clear();
          _emailController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();

          // 🔹 Redireciona após um pequeno atraso
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) Navigator.of(context).pushReplacementNamed('/provider');
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Erro: ${e.message ?? "Erro desconhecido"}'),
            backgroundColor: Colors.red,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Erro: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Cadastrar Cliente',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Nome
                LoginField(
                  controller: _nameController,
                  icon: Icons.person,
                  hintText: 'Nome completo',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // E-mail
                LoginField(
                  controller: _emailController,
                  icon: Icons.email,
                  hintText: 'E-mail',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail';
                    }
                    if (!value.contains('@')) {
                      return 'Digite um e-mail válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Senha
                LoginField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  hintText: 'Senha',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'A senha deve conter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Confirmar senha
                LoginField(
                  controller: _confirmPasswordController,
                  icon: Icons.lock_outline,
                  hintText: 'Confirmar senha',
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                ActionButton(
                  text: 'Cadastrar',
                  onPressed: _isLoading ? null : _handleSignUp,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
