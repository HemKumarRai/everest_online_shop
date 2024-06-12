import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {


   return Scaffold(
    appBar: AppBar(actions: const[
      Icon(Icons.add_alert_sharp,color: Colors.red,)
    ],title: const Text("Hamro Online Shop",style: TextStyle(
      color: Colors.green,
      fontSize: 13.0,
      fontWeight: FontWeight.bold
    ),),
    leading:const  Icon(Icons.safety_check,color: Colors.red,),
    ),
    body: SingleChildScrollView(
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
        physics: const NeverScrollableScrollPhysics(),
       itemCount: 16,

        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
        ),


        itemBuilder: (context,index){
       return  Center(child: card());
        }
        )

      ]),
    ),
    
   
   
   );
  }

  Container card() {
    return Container(
        height: 200,
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
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7zyhum1Qafnoj5ABcky_-hD02-o5EcXblhA&s",height: 140,width: 200,fit: BoxFit.fitWidth,)),
            const SizedBox(height: 8,),
            const Column(
              children: [
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Digital Watch"),
                  Text("Rs.14000"),
                ],
              ),
            ),
                SizedBox(height: 8,),
                SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quantity x4",style: TextStyle(
                        fontSize: 12
                      ),),
                    Row(
                      children: [
                        Icon(Icons.favorite_border,color: Colors.red,),
                        SizedBox(width: 6,),
                      
                        Icon(Icons.add_shopping_cart,color: Colors.indigo,),
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
