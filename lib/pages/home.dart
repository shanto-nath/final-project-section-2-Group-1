import 'package:flutter/material.dart';
import 'package:testproject/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        margin: EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello Shanto,",
              style: AppWidget.boldTextFieldStyle()
             ),
             Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: Icon(Icons.shopping_cart, color: Colors.white,),
          ),
             
          ],
        ),
        SizedBox(height: 20.0,),
        Text(
              "Delicious Food",
              style: AppWidget.HeadlineTextFieldStyle()
             ),  
        Text(
            "Discover and Get Great Food",
              style: AppWidget.LightTextFieldStyle()),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset('images/ice-cream.png', height: 50,width: 50, fit: BoxFit.cover,),
                  ),
                ),
                 Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset('images/pizza.png', height: 50,width: 50, fit: BoxFit.cover,),
                  ),
                ),
                 Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset('images/salad.png', height: 50,width: 50, fit: BoxFit.cover,),
                  ),
                ),
                 Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset('images/burger.png', height: 50,width: 50, fit: BoxFit.cover,),
                  ),
                ), 
              ],)
      ],
      ),
      ),
    );

  }

}