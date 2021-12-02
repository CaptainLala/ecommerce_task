import 'package:ecommerce_task/Screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/products.dart';
import '../Providers/cart_items.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool add = true;
  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(
        seconds: 1,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      content: const Text(
        'Item added to cart!',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      action: SnackBarAction(
        textColor: Colors.amberAccent,
        label: 'Go to your cart',
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            CartPage.routeName,
          );
        },
      ),
    );
    final product = Provider.of<Product>(context);
    final cart = Provider.of<CartItems>(context);
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 15,
        top: 12,
      ),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset(product.image),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 7,
                      bottom: 7,
                    ),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 7,
              left: 7,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price:',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          add
              ? Center(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(
                      top: 12,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          cart.addCartItem(
                            product.id,
                            product.title,
                            product.image,
                            product.price,
                          );
                          add = !add;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Center(
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (cart.quantity(product.id.toString()) == 1 ||
                                    cart.quantity(product.id.toString()) == 0) {
                                  add = !add;
                                }
                              });
                              cart.removeItem(product.id.toString());
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          Container(
                            width: 28,
                            height: 20,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                cart.quantity(product.id.toString()).toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              cart.addCartItem(
                                product.id,
                                product.title,
                                product.image,
                                product.price,
                              );
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
