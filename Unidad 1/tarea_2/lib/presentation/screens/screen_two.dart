import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 2')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botones interactivos
            CustomButton(text: 'Boton 1', onPressed: () {}),
            CustomButton(text: 'Boton 2', onPressed: () {}),
            CustomButton(text: 'Boton 3', onPressed: () {}),
            // Botones usando la propiedad readonly solicitada
            CustomButton(text: 'Boton 4', readOnly: true),
            CustomButton(text: 'Boton 5', readOnly: true),
          ],
        ),
      ),
    );
  }
}
