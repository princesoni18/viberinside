
import 'package:flutter/material.dart';
import 'package:viber/firebase/auth_methods.dart';
import 'package:viber/model/user.dart';


class UserProvider with ChangeNotifier{
Usermodel? _user;
final AuthMethods _authMethods=AuthMethods();
Usermodel get  getUser=> _user!;

Future<void> refreshUser()async{
  Usermodel user=await _authMethods.getUserDetails();
  _user=user;
  notifyListeners();
}


}