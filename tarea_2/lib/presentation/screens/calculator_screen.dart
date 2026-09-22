import 'package:flutter/material.dart';

import '../widgets/calc_button.dart'; // Importamos el botón que acabamos de crear

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double _resultado = 0;

  void _cambiarNumero(int numero) {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    if (n1 == 0) {
      _num1Controller.text = numero.toString();
    } else if (n2 == 0) {
      _num2Controller.text = numero.toString();
    }
  }

  void _borrar() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _resultado = 0;
    });
  }

  void _sumar() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _resultado = n1 + n2;
    });
  }

  void _resta() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _resultado = n1 - n2;
    });
  }

  void _multiplicacion() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _resultado = n1 * n2;
    });
  }

  void _division() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    if (n2 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("¡No se puede dividir sobre 0!"),
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context)
              .primaryColor, // Usa el color del AppTheme
        ),
      );
      return;
    }

    if (n1 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("¡No se dividirá al 0!"),
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context)
              .primaryColor, // Usa el color del AppTheme
        ),
      );
      return;
    }

    setState(() {
      _resultado = n1 / n2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        // El centerTitle, backgroundColor y foregroundColor ya están
        // configurados globalmente en core/theme/app_theme.dart
      ),
      body: Center(
        child: SingleChildScrollView(
          // Añadido para evitar overflow en pantallas pequeñas
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resultado: $_resultado',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge, // Usa la tipografía del AppTheme
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _num1Controller,
                        keyboardType: TextInputType.number, // Práctica recomendada para inputs numéricos
                        decoration: const InputDecoration(
                          labelText: 'Numero 1',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _num2Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Numero 2',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calcbutton(numero: 1, onPress: () => _cambiarNumero(1)),
                  Calcbutton(numero: 2, onPress: () => _cambiarNumero(2)),
                  Calcbutton(numero: 3, onPress: () => _cambiarNumero(3)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calcbutton(numero: 4, onPress: () => _cambiarNumero(4)),
                  Calcbutton(numero: 5, onPress: () => _cambiarNumero(5)),
                  Calcbutton(numero: 6, onPress: () => _cambiarNumero(6)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calcbutton(numero: 7, onPress: () => _cambiarNumero(7)),
                  Calcbutton(numero: 8, onPress: () => _cambiarNumero(8)),
                  Calcbutton(numero: 9, onPress: () => _cambiarNumero(9)),
                ],
              ),
              const SizedBox(height: 20),
              Wrap(
                // Usar Wrap en lugar de Row para los botones de operación evita desbordamientos
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(onPressed: _sumar, child: const Text('SUMAR')),
                  ElevatedButton(onPressed: _resta, child: const Text('RESTA')),
                  ElevatedButton(
                    onPressed: _multiplicacion,
                    child: const Text('MULTIPLICACIÓN'),
                  ),
                  ElevatedButton(
                    onPressed: _division,
                    child: const Text('DIVISIÓN'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _borrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ), // Botón de borrar destacado
                child: const Text('BORRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
