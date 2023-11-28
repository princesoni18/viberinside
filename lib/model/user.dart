import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel{
  final String email;
  
  final String Username;

  final String uid;
 

  Usermodel({required this.email, required this.Username,  required this.uid,});



Map<String,dynamic> toJson()=>{

  'email':email,
  "Username":Username,
  'uid':uid,
  
};

 static Usermodel fromSnap(DocumentSnapshot snap){
  var snapshot= snap.data() as Map<String,dynamic>;

  return Usermodel(
    Username: snapshot['username'],
    uid: snapshot['uid'],
    email: snapshot['email']

  );
 }

}