import 'package:flutter/material.dart';
import 'package:online_shop/controller/product_controller.dart';
import 'package:online_shop/model/product.dart';
import 'package:online_shop/view/edit_product_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final ProductController controller;

  const ProductItem(
      {super.key, required this.product, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.name ?? ''),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProductScreen(
                                currentProduct: product,
                              )));
                },
                icon: const Icon(Icons.edit),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () async{
               await controller.deleteProduct(product.id);
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
