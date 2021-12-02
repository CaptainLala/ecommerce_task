import 'package:ecommerce_task/Widgets/category_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/product_cards.dart';

import '../Providers/products.dart';

class ProductsPage extends StatefulWidget {
  static const routeName = '/products';
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final items = Provider.of<Products>(
      context,
    ).getProducts(args.catId, args.storeId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Scrollbar(
        child: GridView.builder(
          padding: const EdgeInsets.all(5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height * 0.6),
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: items[index],
              child: const ProductCard(),
            );
          },
        ),
      ),
    );
  }
}
