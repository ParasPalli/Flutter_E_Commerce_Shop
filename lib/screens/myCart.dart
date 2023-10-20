import 'package:ecommerce_shop/utils/cartList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class myCart extends StatelessWidget {
  const myCart({super.key});

  _productQuantity(IconData icon) {
    return GestureDetector(
      onTap: () {
        icon == Icons.add ? print("+1") : print("-1");
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: cartList().itemCount,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) => print("Working"),
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
                      title: Text("Product Title"),
                      subtitle: Text("\$59.0"),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          cartList().items[index].img,
                        ),
                      ),
                      trailing: Column(
                        children: [
                          _productQuantity(Icons.add),
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          _productQuantity(Icons.remove),
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
                const Text(
                  "\$252",
                  style: TextStyle(
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
}
