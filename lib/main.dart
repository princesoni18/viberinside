import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viber/firebase_options.dart';
import 'package:viber/screens/home_screen.dart';
import 'package:viber/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  try{await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("firebase done");
  }catch(e){
   print("erroooooooooor $e");
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: ('inter'),
          useMaterial3: true,
        ),
        home:StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.active){
           if(snapshot.hasData){

            return Home_Screen();
           }
           else if(snapshot.hasError){
            return Center(child: Text("some error occured"),);
           }

          }
          if(snapshot.connectionState==ConnectionState.waiting){
             return CircularProgressIndicator(
              color: Colors.white,
             );
          }

          return WelcomeScreen();
        },)
      
    );
  }
}