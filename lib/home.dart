import 'package:flutter/material.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Top App Bar
      appBar: AppBar(
        title: const Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search (future step)
            },
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              // TODO: Implement filter (future step)
            },
          ),
        ],
      ),

      // ✅ Grid Produk
      body: GridView.count(
        crossAxisCount: 2, // 2 kolom
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0, // ukuran card
        children: _buildGridCards(context),
      ),
    );
  }

  List<Widget> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    return products.map((product) {
      return ProductCard(product: product);
    }).toList();
  }
}
