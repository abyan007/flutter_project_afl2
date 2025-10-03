import 'package:flutter/material.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';
import 'backdrop.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Category _currentCategory = Category.all;

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontLayer: AsymmetricView(
        products: ProductsRepository.loadProducts(_currentCategory),
      ),
      backLayer: _buildCategoryMenu(),
      frontTitle: const Text('SHRINE'),
      backTitle: const Text('MENU'),
    );
  }

  Widget _buildCategoryMenu() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      children: Category.values.map((category) {
        return ListTile(
          title: Text(
            category.toString().split('.').last.toUpperCase(),
          ),
          selected: _currentCategory == category,
          onTap: () {
            setState(() {
              _currentCategory = category;
            });
          },
        );
      }).toList(),
    );
  }
}
