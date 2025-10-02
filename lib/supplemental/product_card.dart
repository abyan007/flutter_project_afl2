import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductCard extends StatelessWidget {
  // ✅ Tambahan konstanta untuk tinggi teks
  static const double kTextBoxHeight = 65.0;

  final Product product;

  // ✅ Tambahan property aspect ratio gambar
  final double imageAspectRatio;

  const ProductCard({
    Key? key,
    required this.product,
    this.imageAspectRatio = 33 / 49, // default ratio biar aman
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: imageAspectRatio,
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: kTextBoxHeight,
            child: Center(
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
