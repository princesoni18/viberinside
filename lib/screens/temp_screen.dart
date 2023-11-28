import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:viber/api/api.dart';
import 'package:viber/firebase/storage_methods.dart';


import 'package:viber/utils/image_pick.dart';
import 'package:viber/utils/utils.dart';

class temp extends StatefulWidget {
  const temp({super.key});

  @override
  State<temp> createState() => _tempState();
}

class _tempState extends State<temp> {
  Map<String,dynamic> ?result;
  String display='hi there :)';
  bool isCaption=false;
  String ?captionresult;

  Uint8List?_file;
  bool check=true;
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: captionresult!));
    // You can show a snackbar or any other feedback here
    showSnackbar("caption copied", context);
  }
  void showpopup(){
    showDialog(context: context, builder: (context) {
      return  SimpleDialog(
          title: const Text("Create Vibe"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Take a Photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                
                setState(() {
                  _file=file;
                });
                
                 
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Take from gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                
                  
                  setState(() {
                    _file=file;
                  });
                
                

                
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("cancel"),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            )
          ],
        );
    },);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    backgroundColor:  Color.fromARGB(255, 223, 218, 238),
     appBar: AppBar(title: Text("VIBER"),
      backgroundColor:  Color.fromARGB(255, 223, 218, 238),
      centerTitle: true,),
      body: Center(
        child:_file==null? SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                GestureDetector(
                  onTap: () {
                    showpopup();
                  },
                  child:  Container(
                      margin:EdgeInsets.symmetric(horizontal: 20),
                     decoration: BoxDecoration(
                         color: Color.fromARGB(255, 213, 158, 240),
                         borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 139, 138, 138).withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(0, 3), // Adjust the shadow's position
                                      ),]
                                
                                
                                
                      ),
                      
                      height: 200,
                      width: double.infinity,
                                
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/music_logo.png',height: 100,),
                          Text("Find Music")
                        ],
                      ),
                    ),
                  ),
                
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                GestureDetector(
                  onTap: () {
                    
                    isCaption=true;
                    showpopup();
                  },
                  child: Container(
                   
                    decoration: BoxDecoration(
                       color: Color.fromARGB(255, 213, 158, 240),
                       borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 139, 138, 138).withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Adjust the shadow's position
                                    ),]
                
                    ),
                     margin:EdgeInsets.symmetric(horizontal: 20),
                    height:200,
                    width: double.infinity,
                
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                
                        Image.asset('assets/caption.png',height: 100,),
                        Text("Get a Caption")
                      ],
                    ),
                  ),
                ),
               
                  
              ],
                  
                  
                  
                  
                  
            ),
          ),
        ):SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 260,
                child: Stack(
                  children:[ Container(
                    height: 260,
                    child: Center(child: Image.memory(_file!,)),
                        
                  ),
                 display=="analyzing your image"? Container(
                    height: 260,
                    child: Center(child: Lottie.network("https://lottie.host/7b60959b-707c-42a7-b795-aa7e5327e461/IiTORFD3rD.json",width: 140,))):Container()
                  ]
                ),
              ),
             const SizedBox(height: 20,),
              InkWell(onTap: ()async{
                print("method calles");
               
              setState(() {
                display="sending image to server";
              });
              String url=await Storagemethods().uploadImageToStorage('photos', _file!, true);


               setState(() {
                 display="analyzing your image";
               });
              if(isCaption==false){
                Map<String,dynamic> res =await flask().fetchData(url);
               setState(() {
                 result=res;
                 display="result found :)";
        
              });
              }
              else{
                String result= await flask().findCaption(url);
                setState(() {
                  captionresult=result; 
                  display="result found :)";
                });
                
              }
              },
               child: Container(
                height: 45,
                width: 150,
                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                      colors: [
                                         Color.fromARGB(255, 142, 158, 236),
                                  Colors.deepPurpleAccent,
                                      ]
                                  ),
                                ) ,
                child: Center(child: Text("Find")))),

                const SizedBox(height: 10,),
        
              
            result!=null? Container(
              
              height: 500,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                  itemCount: result!['songs'].length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                    child: ListTile(
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      tileColor: Colors.white,
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 174, 185, 239),
            Color.fromARGB(255, 138, 99, 245),
                                      ]
                                  ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(Icons.music_note_rounded,)),
                      title: Text(result!['songs'][index]['song_name']),
                      subtitle: Text(result!['songs'][index]['artist_name']),
                    ),
                  );
                },),
            ):isCaption==false?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white


                      ),
                      
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 174, 185, 239),
            Color.fromARGB(255, 138, 99, 245),
                                      ]
                                  ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(Icons.closed_caption_off_rounded,)),
                           
                                SizedBox(
                               width: MediaQuery.of(context).size.width-200,
                                child: Text(display)),
                               
                             
                           
                        

                       captionresult!=null? IconButton(onPressed: ()=>_copyToClipboard(), icon: Icon(Icons.copy_rounded)):Lottie.network("https://lottie.host/bfd210df-968e-485c-a721-b0423ae1d072/3HPgEh6TxX.json",height: 80),

                      ],
                     ),

                     
                      
                      

                     
                      
                    ),
                  ):Container(),


            isCaption==true?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white


                      ),
                      
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 174, 185, 239),
            Color.fromARGB(255, 138, 99, 245),
                                      ]
                                  ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(Icons.closed_caption_off_rounded,)),
                           
                                SizedBox(
                               width: MediaQuery.of(context).size.width-200,
                                child: Text(display)),
                               
                             
                           
                        

                       captionresult!=null? IconButton(onPressed: ()=>_copyToClipboard(), icon: Icon(Icons.copy_rounded)):Lottie.network("https://lottie.host/bfd210df-968e-485c-a721-b0423ae1d072/3HPgEh6TxX.json",height: 80),

                      ],
                     ),

                     
                      
                      

                     
                      
                    ),
                  ):Center(),

                  captionresult!=null?Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),

                        child: Text(captionresult!),




                  ):Container(),
              
              
              
        
        
            ],
          ),
        ),

      ),
      floatingActionButton: captionresult!=null?FloatingActionButton(onPressed: ()=>_copyToClipboard(),child: Icon(Icons.copy_rounded),backgroundColor:Color.fromARGB(255, 164, 142, 236), ):null,
    );
  }
}