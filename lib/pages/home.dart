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
        margin: EdgeInsets.only(top: 50,left: 10,right: 10),
        child: Column(children: [
        Text("Hello Shanto,",
         style: AppWidget.boldTextFieldStyle()
         )
      ],
      ),
      ),
    );
  }
}