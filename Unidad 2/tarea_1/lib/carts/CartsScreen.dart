import 'package:flutter/material.dart';

import 'CartsService.dart';
import 'Cart.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  final CartsService _service = CartsService();
  List<Cart> _carts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final response = await _service.execute();
    if (response.isMock && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Aviso de API'),
            content: Text(
              'El endpoint de Carritos no devolvió nada. Mostrando datos de respaldo.\nDetalle: ${response.message}',
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
      _carts = response.data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carritos de compra'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _carts.length,
              itemBuilder: (context, index) {
                final cart = _carts[index];
                return ListTile(
                  leading: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.orange,
                    size: 36,
                  ),
                  title: Text("Cliente - ${cart.userId}"),
                  subtitle: const Text("Click para ver detalles"),
                  onTap: () {
                    // Aquí puedes gestionar el detalle del carrito si lo requieres
                  },
                );
              },
            ),
    );
  }
}
