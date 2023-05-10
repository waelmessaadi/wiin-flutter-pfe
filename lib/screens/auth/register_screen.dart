import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/screens/auth/Page_screen.dart';
import 'package:untitled/screens/auth/login_screen.dart';
import 'package:http/http.dart' as http;
class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController contactnumberController = TextEditingController();

  final TextEditingController roleController = TextEditingController();

    bool _isProviderSelected=true;

    String role="artisan";
  String _inkwellClick = "";

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
    child: Form(
    key: _formKey, child: Column(
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
                                padding: EdgeInsets.only(left: 20),
                                child:Text("Welcome to ",textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
                                ),),),

                            Text("WiiN",textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.green ,fontWeight:FontWeight.w500 ),
                            ),


                          ],
                        ),
                        SizedBox(width:100,),
                        Column(
                          children:<Widget>[
                            Align(
                              alignment: Alignment.bottomLeft ,
                              child: Padding (
                                padding: EdgeInsets.only(top: 15),
                                child:Text("Have an Account?",style:TextStyle(fontSize: 13,fontFamily: 'Poppins',color:Colors.grey)),),),

                            GestureDetector( child:   Text ("Sign in",style:TextStyle(fontSize: 13,fontFamily: 'Poppins',color: Colors.green)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                            )

                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 3,),
                    Align(
                      alignment: Alignment.bottomLeft ,
                      child: Padding (
                        padding: EdgeInsets.only(left: 20),
                        child:Text ("Sign up",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight:FontWeight.bold,
                              fontSize: 40,
                              color:Colors.black

                          ),
                        ),
                      ),
                    ),

                  ],
                ),

    Column (
    children:<Widget>[
    Align (
    alignment: Alignment.bottomLeft ,
    child: Padding (
    padding: EdgeInsets.only(left:27),
    child :Text("Enter your username or email address ",textAlign: TextAlign.left,
    style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
    ),),),
    SizedBox(height: 15,),

    Container (
    margin:EdgeInsets.symmetric(horizontal: 27),
    child: TextFormField(
      controller: emailController,
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
      Row(
          children:<Widget>[
            Align (
              alignment: Alignment.bottomLeft ,
              child: Padding (
                padding: EdgeInsets.only(left:27),
                child :Text("User name ",textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
                ),),),
            SizedBox(width:85),
            Text("Contact Number", style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , )),
          ]
      ),
      SizedBox(height:10),
      Row(
        children: [

      Expanded(
        child:Padding(
          padding:EdgeInsets.fromLTRB(27, 0, 10, 0),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText : 'User Name',
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38
                    ),

                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black38)
                  )
              ),


            ),
          ),
      ),
          SizedBox(width: 10),

        Expanded(
          child:Padding(
            padding:EdgeInsets.fromLTRB(0, 0, 27, 0),
            child: TextFormField(
              controller: contactnumberController,
              decoration: InputDecoration(
                  labelText: 'Contact Number',
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38
                    ),

                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black38)
                  )
              ),

            ),
          ),),
        ],
      ),
    SizedBox(height: 20,),
      Align (
        alignment: Alignment.bottomLeft ,
        child: Padding (
          padding: EdgeInsets.only(left:27),
          child :Text("Enter your password ",textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
          ),),),
      SizedBox(height: 15,),

      Container (
        margin:EdgeInsets.symmetric(horizontal: 27),
        child: TextFormField(
          controller: passwordController,
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
      Row(
        children:<Widget>[

          Align (
            alignment: Alignment.bottomLeft ,
            child: Padding (
              padding: EdgeInsets.only(left:27),
              child :Text("Register as ",textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.black ,fontWeight:FontWeight.w500 , ),
              ),),),
          SizedBox(width: 5,),

            Text("(select one) ",textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins',color:Colors.green,fontWeight:FontWeight.w500 , ),
              ),
        ],
      ),
      SizedBox(height: 10,),
      Padding(
        padding:EdgeInsets.only(left: 27),
     child: Row (
        children: [
          SizedBox(
            height:54,
            width:130,
            child:InkWell(

              onTap: () {
    setState(() {
      _isProviderSelected=true;
      role="artisan";
    });
                },
              child: Container(
                decoration: BoxDecoration(
                  color: _isProviderSelected ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(child: Text('Service Provider',style: TextStyle(fontFamily:'Poppins',fontSize:12,fontWeight: FontWeight.w500,
                    color: _isProviderSelected ? Colors.white : Colors.black,),)),
              ),
            ),
          ),
          SizedBox(width:12),
          SizedBox(
            height:54,
            width:130,
            child:InkWell(

              onTap: () {
                setState(() {
                  _isProviderSelected=false;
                  role="client";

                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _isProviderSelected ? Colors.white : Colors.green,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(child: Text('Service Searcher',style: TextStyle(fontFamily:'Poppins',fontSize:12,fontWeight: FontWeight.w500,
                  color: _isProviderSelected ? Colors.black : Colors.white,),)),
              ),
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 15,),
    SizedBox (
    height:54,
    width:320,
    child:ElevatedButton(
    onPressed : () async{
      if(!EmailValidator.validate(emailController.text.toString())){
        //show email invalide
        print("email invalide ");
      }else
      if(usernameController.text.toString().length<7){
        //show email invalide
        print("username invalide ");
      }
      else
     /* if(contactnumberController.text.toString().length==8){
print("numéro invalide");
      } else*/
     /* if( passwordController.text.toString().length>8){
        print("password invalide");
      }else*/
      {
                              var params = {
                                "name": usernameController.text.toString(),
                                "email": emailController.text.toString(),
                                "password": passwordController.text.toString(),
                                "phone_number":
                                    contactnumberController.text.toString(),
                                "role": role,
                              };

                              var response = await http.post(
                                  Uri.parse(
                                      "https://www.tmkinhost.com/artisan/public/api/register"),
                                  body: params);

                              if (response.statusCode == 200) {
                                // save data in cache
                                final registerJson = jsonDecode(response.body);
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt('email', registerJson['email']);
                                prefs.setInt('name', registerJson['name']);
                                prefs.setInt('userid', registerJson['id']);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => pagePage()),
                                );
                              } else {}
                            }
                          },
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    ),
    backgroundColor: Colors.blue,
    ),
    child: Text('Sign up ',style: TextStyle(fontFamily:'Poppins',fontSize:16,fontWeight: FontWeight.w500),),

    ),
    ),
    ],),
              ],
            ))
          ],
        ),
      ),
      ),
    );
  }
}
