import 'package:flutter/material.dart';
import 'package:viber/screens/home_screen.dart';
import 'package:viber/screens/login_screen.dart';
import 'package:viber/screens/signup_screen.dart';
import 'package:viber/screens/temp_screen.dart';




class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Container(
         height: MediaQuery.of(context).size.height+100,
         width: double.infinity,
         decoration: const BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Color.fromARGB(255, 224, 218, 238),
              Color.fromARGB(255, 188, 166, 248),
              
               
             ]
           )
         ),
         child: Column(
           children: [
              Padding(
               padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.25),
               child: Text("VIBER",style: TextStyle(fontSize: 40,color: Colors.black),)
             ),
              SizedBox(
               height: MediaQuery.of(context).size.height*0.18,
             ),
             const Text('Welcome Back',style: TextStyle(
               fontSize: 30,
               color: Colors.black
             ),),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const loginScreen()));
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                ),
                child: const Center(child: Text('SIGN IN',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),),
              ),
            ),
             const SizedBox(height: 30,),
             GestureDetector(
               onTap: (){
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => RegScreen()));
               },
               child: Container(
                 height: 53,
                 width: 320,
                 decoration: BoxDecoration(
                  // color: Colors.white,
                   borderRadius: BorderRadius.circular(30),
                   border: Border.all(color: Colors.black),
                 ),
                 child: const Center(child: Text('SIGN UP',style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                 ),),),
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
             const Text('Login with Social Media',style: TextStyle(
                 fontSize: 17,
                 color: Colors.black
             ),),//
            const SizedBox(height: 12,),
             //const Image(image: AssetImage('assets/social.png'))
            ]
         ),
       ),
     ),

    );
  }
}