import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_items.dart';

class CartCard extends StatefulWidget {
  final CartItem cartItem;
  final String cartItemID;
  const CartCard({
    Key? key,
    required this.cartItem,
    required this.cartItemID,
  }) : super(key: key);
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return Dismissible(
      onDismissed: (direction) {
        cart.removeItemById(widget.cartItemID);
      },
      key: ValueKey(widget.cartItemID),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.only(
          right: 20,
          bottom: 11,
          top: 22,
        ),
        padding: const EdgeInsets.only(
          right: 20,
        ),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
          top: 20,
        ),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(widget.cartItem.image),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.cartItem.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 80,
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
                          cart.removeItem(widget.cartItemID);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 22,
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
                            '${widget.cartItem.quantity}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cart.addCartItem(
                            widget.cartItem.id,
                            widget.cartItem.title,
                            widget.cartItem.image,
                            widget.cartItem.price,
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
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
