import 'package:flutter/material.dart';

import '../widgets/custom_widgets.dart';
import 'main_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.storefront, color: Colors.blue, size: 40),
                SizedBox(width: 10),
                Text(
                  'TIENDA EXAMEN',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const CustomTextField(hintText: 'Usuario / Correo'),
            const CustomTextField(hintText: 'Contraseña', obscureText: true),
            const SizedBox(height: 20),
            CustomButton(text: 'Aceptar', onPressed: _login),
          ],
        ),
      ),
    );
  }
}
