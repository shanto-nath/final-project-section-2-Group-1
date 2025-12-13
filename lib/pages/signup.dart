import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testproject/pages/bottomnav.dart';
import 'package:testproject/pages/login.dart';
import 'package:testproject/widget/widget_support.dart' show AppWidget;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String email="", password="", name="";

  TextEditingController namecontroller=new TextEditingController();

  TextEditingController passwordcontroller=new TextEditingController();

  TextEditingController mailcontroller=new TextEditingController();

  final _formkey=GlobalKey<FormState>();

  registration()async{
if(password!=null){
  try{
    UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
        content: Text(
      "Registered Successfully", 
      style: TextStyle(fontSize: 20.0),
    )));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
  } on FirebaseException catch(e){
    if(e.code=='Weak-password'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
         content: Text(
        "Password Provided is too weak", 
        style: TextStyle(fontSize: 18.0),
      )));
    } else if(e.code=='email-already-in-use'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
         content: Text(
        "Account Already Exists", 
        style: TextStyle(fontSize: 18.0),
      )));
    }
  }
}
  }




  final Color primaryOrange = const Color(0xFFff5c30);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Set to white so the bottom of screen is white
      body: Stack(
        children: [
          // 1. TOP LAYER: Orange Gradient Background
          Container(
            width: screenWidth,
            height: screenHeight / 2.5, // Taller to ensure it covers behind the card
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primaryOrange, const Color(0xFFe74b1a)],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0), // Push logo up a bit
                child: Image.asset(
                  "images/logo.png",
                  width: screenWidth / 1.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 2. BOTTOM LAYER: The Scrollable Form content
          // We put the SingleChildScrollView on top of the background
          SingleChildScrollView(
            child: Container(
              width: screenWidth,
              // Calculate the margin to create the overlap effect.
              // We push the white container down so it starts partway through the orange header.
              margin: EdgeInsets.only(top: screenHeight / 3.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: [
                    // We need a little spacing inside the white container before the card starts
                    const SizedBox(height: 20.0),

                    // The Card with Shadow
                    GestureDetector(
                      onTap: ()async{
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            email=mailcontroller.text;
                            name=namecontroller.text;
                            password=passwordcontroller.text;
                          });
                        }
                        registration();
                      },
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Sign up',
                                    style: AppWidget.HeadlineTextFieldStyle(),
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                TextFormField(
                                  controller: namecontroller,
                                  validator: (value){
                                    if(value==null|| value.isEmpty){
                                      return 'Please Enter Your Name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: AppWidget.semibooldTextFieldStyle(),
                                    prefixIcon: const Icon(Icons.person_outline, color: Colors.grey),
                                    border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryOrange)),
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                TextFormField(
                                  controller: mailcontroller,
                                  validator: (value){
                                    if(value==null|| value.isEmpty){
                                      return 'Please Enter Your E-mail';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: AppWidget.semibooldTextFieldStyle(),
                                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                                    border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryOrange)),
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                TextFormField(
                                  controller: passwordcontroller,
                                  validator: (value){
                                    if(value==null|| value.isEmpty){
                                      return 'Please Enter Your Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: AppWidget.semibooldTextFieldStyle(),
                                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                                    border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryOrange)),
                                  ),
                                ),
                                const SizedBox(height: 40.0),
                                Center(
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                                      decoration: BoxDecoration(
                                        color: primaryOrange,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins1',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: AppWidget.semibooldTextFieldStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}