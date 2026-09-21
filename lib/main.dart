import 'package:flutter/material.dart';
import 'services/login_page.dart';

void main() {
  runApp(const TriporaApp());
}

class TriporaApp extends StatelessWidget {
  const TriporaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tripora',

      home: LoginPage(),
    );
  }
}