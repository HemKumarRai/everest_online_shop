
import 'package:flutter/material.dart';
import 'package:online_shop/model/product.dart';

class ProductController extends ChangeNotifier{
  List<Product> myProduct= [
    Product(
      name: "Mobile Phone",
      quantity: 2,
      price: 16000,
     productImage: 'https://m.media-amazon.com/images/I/314Rp+8XKWL._AC_SR300,300.jpg',
),
   Product(
     name: "Laptop",
  quantity: 12,
  price: 89000,
  productImage: 'https://e7.pngegg.com/pngimages/63/912/png-clipart-black-microsoft-windows-laptop-computer-laptop-macbook-pro-refurbishment-macbook-air-laptops-gadget-electronics.png',

)
 ];


 void toggleFavorite(int index){
  myProduct[index].isFavorite=!myProduct[index].isFavorite;
  notifyListeners();
}

   

}