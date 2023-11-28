

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:viber/firebase/storage_methods.dart';
import 'package:viber/model/user.dart';


class AuthMethods{

final FirebaseAuth _auth=FirebaseAuth.instance;
final FirebaseFirestore _firestore=FirebaseFirestore.instance;
Future<Usermodel> getUserDetails() async{
  User currentUser=_auth.currentUser!;

  DocumentSnapshot snap=await _firestore.collection('users').doc(currentUser.uid).get();

 return Usermodel.fromSnap(snap);

}

//sign up user
Future<String> signUpUser({
  required String email,
  required String password,
  required String Username,
  

})async{
  String res="some error occured";
  try{
    
    if(email.isNotEmpty||password.isNotEmpty||Username.isNotEmpty){

    UserCredential cred= await  _auth.createUserWithEmailAndPassword(email: email, password: password);
     
     // add user to the data base
     Usermodel usermodel=Usermodel(email: email,  Username: Username,  uid: cred.user!.uid,);

     //storing details in database
     await _firestore.collection('users').doc(cred.user!.uid).set(usermodel.toJson());

    }
    res="Success";

  } on FirebaseAuthException catch(err){
    if(err.code=='invalid-email'){
      print("the email is badly Formatted");
    }else if(err.code=='weak-password'){
      print("weak password......");
    }
  }
   catch(err){
    res=err.toString();
    print(res);
  }
  return res;


}

Future<String>logInUser(
  {
    required String email,
    required String password,
  }
)async{
  String res="Some Error Occured";
  try{
    if(email.isNotEmpty||password.isNotEmpty)
  {
   UserCredential cred= await _auth.signInWithEmailAndPassword(email: email, password: password);
   
   res="Success";
  }
  else{
    res="PleaseEnter all the Fields";
  }
  }catch(err){
    res=err.toString();
    print(err.toString());
  }
  return res;

}


}