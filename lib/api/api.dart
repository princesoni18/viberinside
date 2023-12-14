import 'dart:convert';

import 'package:http/http.dart' as http;

class flask{
 
Future<Map<String,dynamic>> fetchData(String url) async {
    
   
   const apiUrl = "http:/process_image";

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"image_url": url}),
    );
    // print(response.body);
    if (response.statusCode == 200) {
    


  

  Map<String,dynamic> mp= jsonDecode(response.body);
  


  
    // print("printing mapp resullts");
    // print(mp);
      
      return mp;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle exceptions
    print(e.toString());
    return {};
  }
  
  
  }
  Future<String> findCaption(String url) async {
    
   
   const apiUrl = "http://192.168.127.191:5000/process_caption";

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"image_url": url}),
    );
    
    if (response.statusCode == 200) {
    


  

  String res= jsonDecode(response.body);
  


  
    //  print("printing mapp resullts");
    //  print(res);
      
      return res;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle exceptions
    print(e.toString());
    return 'failed to load';
  }
  
  
  }
  
  }
