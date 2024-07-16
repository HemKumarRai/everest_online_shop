import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/model/product.dart';

class ProductController extends ChangeNotifier {
  //add -> post
  //fetch or ->get
  //update ->put
  //delete- > delete
  final myServerUrl = "https://everest-shop-20f5c-default-rtdb.firebaseio.com/";

  List<Product> myProduct = [
    // Product(
    //   id: '1',
    //   name: "Mobile Phone",
    //   quantity: 2,
    //   price: 16000,
    //   productImage:
    //       'https://m.media-amazon.com/images/I/314Rp+8XKWL._AC_SR300,300.jpg',
    // ),
    // Product(
    //   id: '2',
    //   name: "Laptop",
    //   quantity: 12,
    //   price: 89000,
    //   productImage:
    //       'https://e7.pngegg.com/pngimages/63/912/png-clipart-black-microsoft-windows-laptop-computer-laptop-macbook-pro-refurbishment-macbook-air-laptops-gadget-electronics.png',
    // ),
    // Product(
    //   id: '3',
    //   name: "Laptop",
    //   quantity: 12,
    //   price: 89000,
    //   productImage:
    //       'https://e7.pngegg.com/pngimages/63/912/png-clipart-black-microsoft-windows-laptop-computer-laptop-macbook-pro-refurbishment-macbook-air-laptops-gadget-electronics.png',
    // )
  ];

  void toggleFavorite(int index) {
    myProduct[index].isFavorite = !myProduct[index].isFavorite;
    notifyListeners();
  }

  Future<void> addProduct(
      String name, double price, int quantity, String imageUrl) async {
    final prodId = DateTime.now().microsecondsSinceEpoch.toString();
    Product newProduct = Product(
        id: prodId,
        productImage: imageUrl,
        name: name,
        price: price,
        quantity: quantity);
    final url = '${myServerUrl}products.json';
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          "id": prodId,
          "productImage": imageUrl,
          "name": name,
          "price": price.toString(),
          "quantity": quantity.toString()
        }));
    if (response.statusCode == 200) {
      myProduct.add(newProduct);
    } else {}

    notifyListeners();
  }

  Future<void> editProduct(String id, String name, double price, int quantity,
      String imageUrl) async {
    final url = '${myServerUrl}products/$id.json';
    final response = await http.put(Uri.parse(url),
        body: json.encode({
          "id": id,
          "name": name,
          "price": price.toString(),
          "productImage": imageUrl,
          "quantity": quantity.toString()
        }));
    if (response.statusCode == 200) {
      var currentProduct = myProduct.firstWhere((element) => element.id == id);
      int selectedProductIndex = myProduct.indexOf(currentProduct);
      Product editedProduct = Product(
          id: id,
          name: name,
          price: price,
          productImage: imageUrl,
          quantity: quantity);
      myProduct[selectedProductIndex] = editedProduct;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      final url = '${myServerUrl}products/$id.json';
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        myProduct.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllProducts() async {
    try {
      final url = '${myServerUrl}products.json';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> extractedData = json.decode(response.body);
        extractedData.forEach((key, value) {
          final id = key;
          final name = value['name'];
          final price = double.parse(value['price']);
          final image = value['productImage'];
          final quantity = int.parse(value['quantity']);
          final newProduct = Product(
              id: id,
              price: price,
              quantity: quantity,
              productImage: image,
              name: name);
          myProduct.add(newProduct);
          notifyListeners();
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
