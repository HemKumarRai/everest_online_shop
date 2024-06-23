

import 'package:flutter/material.dart';
import 'package:online_shop/controller/product_controller.dart';
import 'package:online_shop/model/product.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//  ProductController controller = ProductController();



  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<ProductController>(context,listen: false);


  return Scaffold(
    appBar: AppBar(actions: const[
      Icon(Icons.add_alert_sharp,color: Color.fromARGB(255, 234, 234, 234),)
    ],title: const Text("Hamro Online Shop",style: TextStyle(
      color: Colors.green,
      fontSize: 13.0,
      fontWeight: FontWeight.bold
    ),),
    leading:const  Icon(Icons.safety_check,color: Colors.red,),
    ),
    body: Consumer<ProductController>(
      builder:(context,controller,child)=>SingleChildScrollView(
      child: Column(
          children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 14,right: 14,top: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),color: Colors.green
          ),
          child: Row(
            children: [
              Image.network("https://tmssl.akamaized.net/images/foto/galerie/neymar-brazil-2022-1668947300-97010.jpg?lm=1668947335",height: 200,width: 200,fit: BoxFit.cover,),
              const SizedBox(width: 14,),
              const Expanded(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hey, Hem Kumar Rai",style: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold
                    ),),
                    Text('Bafal,',style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w400
                    ),),
                    Text('9800909090',style: TextStyle(
                      fontSize: 14,fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              )


            ],
          ),
        ),

      const SizedBox(height: 14,),

  
        GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 14),
        physics: const NeverScrollableScrollPhysics(),
       itemCount: controller.myProduct.length,

       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         childAspectRatio: 0.8,
         mainAxisSpacing: 20,
         crossAxisSpacing: 20
        ),

       itemBuilder: (context,index){
       return  Center(child: card(controller.myProduct[index],controller,index));
        }
        )

      ]),
    ) ,

    ),
     );
  }

  Widget card(Product product,ProductController controller,int index) {
    return Container(
        // height: 200,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
                child: Image.network(product.productImage??"",height: 140,width: 200,fit: BoxFit.fitWidth,)),
            const SizedBox(height: 8,),
             Column(
              children: [
             SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.name??''),
                  Text((product.price??0.0).toString()),
                ],
              ),
            ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("Quantity: ${product.quantity??0}",style: const TextStyle(
                        fontSize: 12
                      ),),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                         
                      controller.toggleFavorite(index);
                      
              
                          },
                          
                          child:  Icon(
                            product.isFavorite?Icons.favorite: Icons.favorite_border,color: Colors.red,)),
                        const SizedBox(width: 6,),
                      
                        const Icon(Icons.add_shopping_cart,color: Colors.indigo,),
                      ],
                    )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
  }
}
