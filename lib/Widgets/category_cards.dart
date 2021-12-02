import 'package:ecommerce_task/Screens/products_page.dart';
import 'package:flutter/material.dart';
import '../Providers/stores.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final String storeId;
  const CategoryCard({Key? key, required this.category, required this.storeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductsPage.routeName,
          arguments: ScreenArguments(category.id, storeId),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                const Color.fromRGBO(113, 134, 227, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              category.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String catId;
  final String storeId;

  ScreenArguments(this.catId, this.storeId);
}
