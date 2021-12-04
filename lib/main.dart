import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflixui/screens/root_screen.dart';
import 'package:netflixui/theme/AppColors.dart';

void main() {
   
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black
  ));




  runApp(
      MaterialApp(
    color: backgroundpt,
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: RootApp(),
  ));
}

