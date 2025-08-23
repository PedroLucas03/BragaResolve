import 'package:braga_resolve/Screens/homepage.dart';
import 'package:braga_resolve/Screens/initialScreen.dart';
import 'package:braga_resolve/Screens/providerLogin.dart';
import 'package:braga_resolve/Screens/userPage.dart';
import 'package:flutter/material.dart';
import 'Screens/clientLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Braga Resolve',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const InitialScreen(),
        '/provider': (BuildContext context) => const ProviderLogin(),
        '/client': (BuildContext context) => const ClientLogin(),
        '/homepage': (BuildContext context) => const HomePage(),
        '/user': (BuildContext context) => const UserPage(),
      },
    );
  }
}
