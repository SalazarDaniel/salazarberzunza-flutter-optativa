import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/calculator_screen.dart';
import 'presentation/screens/screen_two.dart';
import 'presentation/screens/screen_three.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Práctica Flutter',
      debugShowCheckedModeBanner: false,
      // 1. Inyectamos nuestra clase de diseño centralizada
      theme: AppTheme.getTheme(),

      // 2. Definimos la ruta inicial
      initialRoute: '/',

      // 3. Sistema de rutas
      routes: {
        '/': (context) => const HomeScreen(),
        '/calculadora': (context) => const CalculatorScreen(),
        '/pantalla2': (context) => const ScreenTwo(),
        '/pantalla3': (context) => const ScreenThree(),
      },
    );
  }
}
