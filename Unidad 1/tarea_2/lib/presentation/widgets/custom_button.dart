import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool readOnly;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.readOnly = false, // Por defecto es false
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity, // Ocupa todo el ancho disponible
        child: ElevatedButton(
          // Si readOnly es true, el onPressed es null (se deshabilita el botón visual y funcionalmente)
          onPressed: readOnly ? null : onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
