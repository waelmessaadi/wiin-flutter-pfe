import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: Container(
        margin:EdgeInsets.only(top:20,left:15,right:15),
        height:630,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.all( Radius.circular(40)),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children:<Widget>[
                    Text("Welcome to WIN",textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                    ),
                    SizedBox(width:200,),
                    Column(
                      children:<Widget>[
                    Text("No Account?",style:TextStyle(fontSize: 13,fontFamily: 'Poppins',color:Colors.grey)),
                    Text("Sign up",style:TextStyle(fontSize: 13,fontFamily: 'Poppins',color: Colors.green)),
  ],
                    ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Sign in",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight:FontWeight.bold,
                          fontSize: 40,
                          color:Colors.black),)


                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Enter your username or email address"),
                      inputFile(label: "Enter your Password", obscureText: true)
                    ],
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Forgot Password"),
                    Text(" Sign in", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,

                    ),)
                  ],
                ),


              ],
            ))
          ],
        ),
      ),

    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color:Colors.black
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black38
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );

}