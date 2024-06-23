class Product{
String? productImage;
String? name;
double? price;
int? quantity;
bool isFavorite;
bool? isAddToCart;

Product({this.isAddToCart,this.isFavorite=false,this.name,
this.price,this.productImage,this.quantity});
}