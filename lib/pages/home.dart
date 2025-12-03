import 'package:flutter/material.dart';

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
        margin: EdgeInsets.only(top: 100,left: 100,right: 100),
        child: Column(children: [
        Text("Shanto", style: TextStyle(color:Colors.black,),)

      ],),),
    );
  }
}