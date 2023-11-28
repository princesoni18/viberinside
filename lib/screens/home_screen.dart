


import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import 'package:viber/screens/temp_screen.dart';


class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  
  var Data;
  String query="query";


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 223, 218, 238),
      appBar: AppBar(title: Text("VIBER"),
      backgroundColor:  Color.fromARGB(255, 223, 218, 238),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
        
          
          
          children: [
      
            
      
            
            SizedBox(height: MediaQuery.of(context).size.height*0.048),
          FanCarouselImageSlider(
            
            
              imagesLink: ["assets/img1.jpg","assets/img2.jpg","assets/img3.jpg"],
              isAssets: true,
              initalPageIndex: 0,
              sliderHeight: MediaQuery.of(context).size.height*0.65,
              isClickable: false,
              
            ),
      
      
      
      
      
            const SizedBox(height: 40,),
      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
          child: InkWell(
      
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => temp(),));
            },
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Color.fromARGB(255, 169, 143, 238),
              ),
               child: Center(
                child: Text("create a Vibe"),
               ),
             ),
          ), ),
      
          
      
         
      
          
            
          ],
        )
        
      ),
    );
  }
}