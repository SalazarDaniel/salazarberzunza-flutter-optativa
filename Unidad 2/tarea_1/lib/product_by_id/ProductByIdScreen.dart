import 'package:flutter/material.dart';

import 'ProductByIdService.dart';
import '../products/Product.dart';

class ProductByIdScreen extends StatefulWidget {
  final int productId;
  const ProductByIdScreen({super.key, required this.productId});

  @override
  State<ProductByIdScreen> createState() => _ProductByIdScreenState();
}

class _ProductByIdScreenState extends State<ProductByIdScreen> {
  late final ProductByIdService _service;
  Product? _product;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _service = ProductByIdService(widget.productId);
    _loadProduct();
  }

  void _loadProduct() async {
    final response = await _service.execute();
    if (response.isMock && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Aviso de API'),
            content: Text(
              'El endpoint no devolvió nada. Mostrando datos de respaldo.\nDetalle: ${response.message}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }
    setState(() {
      _product = response.data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _product == null
          ? const Center(child: Text('Producto no encontrado'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    _product!.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Image.network(
                    _product!.image,
                    height: 200,
                    errorBuilder: (c, e, s) =>
                        const Icon(Icons.image, size: 200),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _product!.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Precio: \$${_product!.price}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Agregar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Eliminar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
