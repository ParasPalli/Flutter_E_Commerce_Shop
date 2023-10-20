import 'package:ecommerce_shop/utils/cartList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class myCart extends StatefulWidget {
  const myCart({super.key});

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  _productQuantity(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          icon == Icons.add
              ? Provider.of<cartList>(context, listen: false)
                  .incrementQuantity(index)
              : Provider.of<cartList>(context, listen: false)
                  .decrementQuantity(index);
        });
      },
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "My Cart",
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: Provider.of<cartList>(context).itemCount,
            itemBuilder: (context, index) {
              var item = Provider.of<cartList>(context).items[index];

              return Slidable(
                endActionPane: ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          Provider.of<cartList>(context, listen: false)
                              .deleteItem(index),
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      label: "Delete",
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(item.productName),
                    subtitle: Text(item.price.toString()),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        item.img,
                        width: 85,
                      ),
                    ),
                    trailing: Column(
                      children: [
                        _productQuantity(Icons.add, index),
                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        _productQuantity(Icons.remove, index),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 13,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Provider.of<cartList>(context).getTotal(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Payment Gateway Code....
                },
                icon: const Icon(
                  Icons.send,
                ),
                label: const Text(
                  "Check Out",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
