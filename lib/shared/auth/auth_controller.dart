// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;
  
  void setUser(BuildContext context, UserModel? user) {

    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context,  "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser( UserModel user) async {
    final  instance = await SharedPreferences.getInstance();
    await instance.setString("user",  user.toJson());
  }

  Future<void> currentUser(BuildContext context) async {
    final  instance = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
   if(instance.containsKey("user")) {
     final json = instance.get("user") as String;
    setUser(context, UserModel.fromJson(json));
   } else {
    setUser(context, null);
   }
  }
}
