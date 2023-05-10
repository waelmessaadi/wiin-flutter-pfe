import 'package:flutter/material.dart';

AppBar header(context, { bool isAppTitle =false, required String titleText})
{
  return AppBar(
iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      isAppTitle ? "Home" : titleText,

          style:TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.w500)
    ),
  backgroundColor: Colors.white,
  );

}