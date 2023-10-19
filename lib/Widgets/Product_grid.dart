import 'package:ecommerce_shop/screens/productDetails.dart';
import 'package:flutter/material.dart';

import '../Models/products.dart';
import '../utils/calculateDiscount.dart';

class ProductGrid extends StatelessWidget {
  final List<Products> snapshot;
  const ProductGrid({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6, // Width/Height
        ),
        itemCount: snapshot.length,
        itemBuilder: (context, index) {
          return SingleGrid(index: index, snapshot: snapshot);
        },
      ),
    );
  }
}

class SingleGrid extends StatelessWidget {
  final List<Products> snapshot;
  final int index;
  const SingleGrid({super.key, required this.index, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => productDetails(snapshot: snapshot[index]),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  snapshot[index].thumbnail,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                snapshot[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "${snapshot[index].description}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$${snapshot[index].price}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    '\$${calculateDiscount(
                      snapshot[index].price,
                      snapshot[index].discountPercentage,
                    )}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    '${snapshot[index].discountPercentage}%',
                    style: const TextStyle(
                      color: Color(0xFF23DD4C),
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
