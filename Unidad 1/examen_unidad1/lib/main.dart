import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  runApp(const TiendaExamenApp());
}

class TiendaExamenApp extends StatelessWidget {
  const TiendaExamenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda Examen',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
