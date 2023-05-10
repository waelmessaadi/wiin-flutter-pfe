import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/Widgets/header.dart';
import 'package:untitled/screens/auth/portfolio_screen.dart';
import 'Drawer.dart';
import 'package:image_picker/image_picker.dart';
class Profile extends StatefulWidget {
  Profile({Key? key}):super(key:key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File? _imageFile = null;
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar:(
            header(context,titleText: 'Profile')
        ),
        drawer: myDrawer(child: ListView()),
        body: ListView(
          children:[Column(
            children:<Widget>[
              Container(
                padding: EdgeInsets.all(10), // Ajoute une marge interne de 10 à tous les côtés
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligne les éléments à gauche
                  children: [
                    Row(children:[
                      Align(
                        alignment:Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(27, 27, 0, 0),
                          child:  InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: _imageFile == null
                                  ? Icon(Icons.add_a_photo)
                                  : Image.file(_imageFile!, fit: BoxFit.cover),
                            ),
                          ),

                        ),),
                      SizedBox(width: 10), // Ajoute un espace entre l'image et le texte
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mohamed Alaya',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Painter',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Gabes ,Tunisia',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],

                    ),
                    SizedBox(height: 14), // Ajoute un espace entre les deux conteneurs horizontaux
                    Row(
                      children: [
                        Expanded(
                          child:Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Container(
                              width: 159,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.message_outlined, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Send Message',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Ajoute un espace entre les deux conteneurs horizontaux
                        Expanded(
                          child:Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: Container(
                              width: 159,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.account_balance_wallet, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  GestureDetector(child:Text(
                                    'See Portfolio',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Portfolio()),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child:
                TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(
                        Icons.person,
                        color: Color(0xff808080),
                      ),
                      labelText: "Name",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child:
                TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff808080),
                      ),
                      labelText: "Localisation",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child:
                TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(
                        Icons.email_outlined,
                        color: Color(0xff808080),
                      ),
                      labelText: "Email",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child:
                TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(
                        Icons.phone,
                        color: Color(0xff808080),
                      ),
                      labelText: "Contact Number",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child:
                TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xff808080),
                      ),
                      labelText: "Date Of Birth",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child:
                TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(
                        Icons.perm_identity_outlined,
                        color: Color(0xff808080),
                      ),
                      labelText: "Sexe",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )
                ),
              ),
            ],),
          ],),
      ),
    );
  }
  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Color(0xffDADADA),
          width: 3,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Color(0xffDADADA),
          width: 3,
        )
    );
  }

}
