import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}