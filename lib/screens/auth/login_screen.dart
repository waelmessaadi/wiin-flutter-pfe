import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/screens/auth/forgot_password_screen.dart';
import 'package:untitled/screens/auth/register_screen.dart';


class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: Container(
        alignment: Alignment.bottomLeft,
        margin:EdgeInsets.only(top:20,left:15,right:15),
        height:750,
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
                        Row(
              children:<Widget>[
                  Align(
                  alignment: Alignment.bottomLeft ,
                  child: Padding (
                    padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
                    child:Text("Welcome to ",textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
                    ),),),

                   Text("WiiN",textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.green ,fontWeight:FontWeight.w500 ),
                    ),


  ],
                    ),
                    SizedBox(width:120,),
                    Column(
                      children:<Widget>[
                        Align(
                          alignment: Alignment.bottomLeft ,
                          child: Padding (
                            padding: EdgeInsets.only(top: 15),
                    child:Text("No Account?",style:TextStyle(fontSize: 13,fontFamily: 'Poppins',color:Colors.grey)),),),

                        GestureDetector( child:
                        Text ("Sign up",style:TextStyle(fontSize: 13,fontFamily: 'Poppins',color: Colors.green)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                        )
                        ,

  ],
                    ),

                      ],
                    ),
                    SizedBox(height: 3,),
        Align(
          alignment: Alignment.bottomLeft ,
          child: Padding (
            padding: EdgeInsets.only(left: 20),
                    child:Text ("Sign in",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight:FontWeight.bold,
                          fontSize: 40,
                          color:Colors.black

                      ),
                    ),
          ),
        ),],
                ),
        SizedBox(height: 60,),
        Column (
          children:<Widget>[
            Align (
              alignment: Alignment.bottomLeft ,
              child: Padding (
                padding: EdgeInsets.only(left:27),
                child :Text("Enter your username or email address ",textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
                ),),),
            SizedBox(height: 20,),
            Container (
              margin:EdgeInsets.symmetric(horizontal: 27),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(

                    labelText : 'Username or email address',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black38
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black38)
                    )
                ),
              ),
            ),
SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomLeft ,
              child: Padding (
                padding: EdgeInsets.only(left:27),
                child :Text("Enter your password ",textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
                ),),),
            SizedBox(height: 20,),

            Container (
              margin:EdgeInsets.symmetric(horizontal: 27),
              child: TextField(
                controller: _pwdController,

                decoration: InputDecoration(
                    labelText : 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black38
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black38)
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),

             Padding(
              padding: const EdgeInsets.fromLTRB(250, 1, 10, 10),
              child: GestureDetector( child:
              Text("Forgot Password",style: TextStyle( fontFamily: 'Poppins',
                  fontWeight:FontWeight.w400,
                  fontSize: 11,
                  color:Colors. green

              ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPage()),
                  );
                },
              ),
            ),
        /*  Align(
              alignment: Alignment.bottomLeft ,
              child: Padding (
                padding: EdgeInsets.fromLTRB(250, 1, 10, 10),

                GestureDetector( child: Text("Forgot Password",style: TextStyle( fontFamily: 'Poppins',
                    fontWeight:FontWeight.w400,
                    fontSize: 11,
                    color:Colors. green

                ),),

                ),
              ),),*/
            SizedBox(height: 50,),
            SizedBox (
              height:54,
              width:320,
              child:ElevatedButton(
                onPressed : () async {

                  //call api login
                  var params = {
                    "email": _emailController.text.toString(),
                    "password": _pwdController.text.toString(),
                    "identity_matrix": ""
                  };

                  var response = await http.post(Uri.parse("https://www.sheltere.com/api/v2/auth/login"),
                      body: json.encode(params)
                      ,headers: {
                        "Accept": "*/*",
                        "Content-Type": "application/json"});

                  print('reponse : ${response.body}');
                  print('reponse code : ${response.statusCode}');


                  if (response.statusCode == 200) {
                    var data = json.decode(response.body);
                    var rest = data["user"]["name"];
                    print(rest);
                    // list = rest.map<Article>((json) => Article.fromJson(json)).toList();
                  }
                },


                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text('Sign in ',style: TextStyle(fontFamily:'Poppins',fontSize:16,fontWeight: FontWeight.w500),),

              ),
            ),


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


