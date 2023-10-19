import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../utils/cartList.dart';

class cartItem extends StatelessWidget {
  final int index;
  const cartItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              print("Button Working...");
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          )
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  cartList().items[index].img,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartList().items[index].productName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "\$${cartList().items[index].price}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  productQuantity(icon: Icons.add),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${cartList().items[index].quantity}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  productQuantity(icon: Icons.remove),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class productQuantity extends StatelessWidget {
  final IconData icon;
  const productQuantity({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        icon == Icons.add ? print("+1") : print("-1");
      },
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
