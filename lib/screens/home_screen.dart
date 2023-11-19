

// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:viber/api/api.dart';
// import 'package:viber/utils/image_pick.dart';

// class Home_Screen extends StatefulWidget {
//   const Home_Screen({super.key});

//   @override
//   State<Home_Screen> createState() => _Home_ScreenState();
// }

// class _Home_ScreenState extends State<Home_Screen> {
//   Uint8List?_file;
//   var Data;
//   String query="query";


//   void showpopup(){
//     showDialog(context: context, builder: (context) {
//       return  SimpleDialog(
//           title: const Text("Create Vibe"),
//           children: [
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(20),
//               child: const Text("Take a Photo"),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 Uint8List file = await pickImage(ImageSource.camera);
//                 setState(() {
//                   _file = file;
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(20),
//               child: const Text("Take from gallery"),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 Uint8List file = await pickImage(ImageSource.gallery);
//                 setState(() {
//                   _file = file;
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(20),
//               child: const Text("cancel"),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         );
//     },);

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:  Color.fromARGB(255, 223, 218, 238),
//       appBar: AppBar(title: Text("VIBER"),
//       backgroundColor:  Color.fromARGB(255, 223, 218, 238),
//       centerTitle: true,),
//       body: SingleChildScrollView(
//         child:_file==null? Column(
//           crossAxisAlignment:CrossAxisAlignment.center ,
        
          
          
//           children: [
      
            
      
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 80),
//             //   child: Container(
//             //     height: 300,
//             //     width: 300,
//             //     color: Colors.amber,
//             //   ),
//             // ),
//             SizedBox(height: MediaQuery.of(context).size.height*0.048),
//           FanCarouselImageSlider(
//               imagesLink: ["https://cdn.pixabay.com/photo/2022/10/30/12/26/automn-7557374_640.jpg",
//               "https://cdn.pixabay.com/photo/2019/10/29/10/16/model-4586589_640.jpg",
//               "https://cdn.pixabay.com/photo/2019/09/28/05/10/sunset-4509879_1280.jpg"],
//               isAssets: false,
//               initalPageIndex: 0,
//               sliderHeight: MediaQuery.of(context).size.height*0.65,
              
//             ),
      
      
      
      
      
//             const SizedBox(height: 40,),
//       Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 80),
//           child: InkWell(
      
//             onTap: (){
//               showpopup();
//             },
//             child: Container(
//               height: 40,
//               width: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: const Color.fromARGB(255, 229, 110, 250),
//               ),
//                child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                 Text("select file"),Icon(Icons.upload)],),
//              ),
//           ), ),
      
          
      
         
      
          
            
//           ],
//         ): Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [

//           Center(
//             child: InkWell(
//               onTap: () async{
//                Data=await Getdata("http://127.0.0.1:5000/api?query=hii");
//               var decodedData= jsonDecode(Data);
//                setState(() {
//                  query=decodedData['query'];
//                });
              
               
//               },
//               child: Container(
                
//                 height: 300,
//                 width: 200,
                      
//                 decoration: BoxDecoration(
                  
//                   border: Border.all(color: Colors.black),
//                   image: DecorationImage(
                      
//                   image: MemoryImage(_file!)
                  
//                 ),
                
//               ),
              
              
                
//                 child: Lottie.network("https://lottie.host/70c03e82-ceac-4642-b840-b94eb3aece5e/Woj80nkDSv.json",
//                 fit: BoxFit.contain ),
//                     ),
//             ),

//           ),

//           Text(query),
//           ],
//         ),
//       ),
//     );
//   }
// }