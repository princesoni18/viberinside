import 'dart:convert';

import 'package:http/http.dart' as http
;
class Blip2{


  Future<String> Uploadimage(String url)async{
   
   try{

    final res =  await http.post(Uri.parse("https://api.clarifai.com/v2/users/clarifai/apps/main/models/general-image-recognition/versions/aa7f35c01e0642fda5cf400f543e7c40/outputs"),
   headers: {
    "Authorization": "Key 257172bd4ef7423ba0d1660d22f150e3",
    "Content-Type": "application/json",



   },
   body: jsonEncode({
    "inputs": [
      {
        "data": {
          "image": {
            "url": url,
          },
        }
      },
    ]

   }
  ),
   
   );
   print(jsonDecode(res.body));
  // Map<String,dynamic> jsondata=jsonDecode(res.body);

  // print("aftrerrerer this");
  //  print(jsondata);
   return 'yes';
   }
   catch(e){

    print(e.toString());

    return 'not';
   }
     
 



  }
 }