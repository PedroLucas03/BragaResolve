import 'package:braga_resolve/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: ElevatedButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            const SizedBox(width: 12),
            Text(
              'Habilitar Modo ${themeProvider.themeMode == ThemeMode.dark ? 'Claro' : 'Escuro'}',
            ),
          ],
        ),
        onPressed: () {
          themeProvider.toggleTheme(themeProvider.themeMode == ThemeMode.light);
        },
      ),
    );
  }
}
