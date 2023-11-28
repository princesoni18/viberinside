import 'dart:convert';

import 'package:http/http.dart' as http
;
class Caption{


  Future<String> Uploadimage(String url)async{
   
   try{

    http.Response res =  await http.post(Uri.parse("https://api.clarifai.com/v2/users/salesforce/apps/blip/models/general-english-image-caption-blip/versions/cdb690f13e62470ea6723642044f95e4/outputs"),
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
    // print("Status code: ${res.statusCode}");
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