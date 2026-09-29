import 'package:flutter/material.dart';

class Calcbutton extends StatelessWidget {
  final int numero;
  final VoidCallback onPress;

  const Calcbutton({super.key, required this.numero, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(
          20,
        ), // Tamaño para que parezca botón de calculadora
      ),
      child: Text(numero.toString(), style: const TextStyle(fontSize: 20)),
    );
  }
}
