// This sample shows adding an action to an [AppBar] that opens a shopping cart.
import 'package:foods1/home/location.dart';
import 'package:flutter/material.dart';
import 'login/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
  var number = prefs.getString("no");
  print(number);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false
        ,home:  MyApp())
  );
}


