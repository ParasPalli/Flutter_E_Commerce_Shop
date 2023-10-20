import 'package:ecommerce_shop/utils/cartList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

import '../Models/products.dart';
import '../utils/calculateDiscount.dart';
import 'myCart.dart';

class productDetails extends StatelessWidget {
  final Products snapshot;
  const productDetails({super.key, required this.snapshot});

  List<Image> getImages() {
    List<Image> imgs = [];

    for (String url in snapshot.images) {
      Image img = Image.network(url);
      imgs.add(img);
    }
    return imgs;
  }

  @override
  Widget build(BuildContext context) {
    final discount = calculateDiscount(
      snapshot.price,
      snapshot.discountPercentage,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 300,
              autoPlayInterval: 3000,
              initialPage: 0,
              isLoop: true,
              children: getImages(),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          snapshot.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Text(
                        "\$$discount",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    snapshot.description,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
          ],
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
                "\$$discount",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Provider.of<cartList>(context, listen: false).addTask(
                    snapshot.title,
                    snapshot.thumbnail,
                    discount,
                    1,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myCart(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.send,
                ),
                label: const Text(
                  "Add to Cart",
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
