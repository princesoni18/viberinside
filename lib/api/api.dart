import 'package:http/http.dart' as http;


 Getdata(url)async{
  print("api calleddddddd");
  http.Response response= await http.get(Uri.parse(url));

  

  return response.body;
}