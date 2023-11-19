import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:viber/api/api.dart';

class temp extends StatefulWidget {
  const temp({super.key});

  @override
  State<temp> createState() => _tempState();
}

class _tempState extends State<temp> {
   var Data;
   String url='http://127.0.0.1:5000/api?query=hello';
  String query="query";
  void checker()async{
     Data=await Getdata(url);

     var decoded= jsonDecode(Data);
     setState(() {
       query=decoded['query'];
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
      
          children: [
      
      const SizedBox(height: 200,),
      
            ElevatedButton(onPressed: ()async{
               checker();
               }, child: Text("send")),
      
      
               Text(query)
          ],
        ),
      )
    );
  }
}