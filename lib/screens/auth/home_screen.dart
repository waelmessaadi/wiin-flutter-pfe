import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Widgets/header.dart';
import 'package:untitled/screens/auth/Drawer.dart';
import 'portfolio_screen.dart';

import 'package:intl/intl.dart';
class ListItem {
  final String title;
  final String soustitre;
  final String imageUrl;
  final   String text;
  final Function() onPressed;

  ListItem({required this.title,required this.soustitre, required this.imageUrl,required this.text,required this.onPressed});
}
class Home extends StatefulWidget {


  Home({Key? key}):super(key:key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = '';

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Contact the provider'),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        content: TextField(
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            labelText: 'write your message here..',
          ),
          onChanged: (value) {
            setState(() {
              _text = value;
            });
          },
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Send'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250.0, 30.0),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
  String _selectedFilter = 'Tous';
  final List<ListItem> _listItems = [
    ListItem(
        title: 'Mohamed Alaya ',
        soustitre: 'Posted 5mins ago',
        imageUrl:
        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        text:'bla bla bla bla bla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla bla',
        onPressed: () {

        }

    ),
    ListItem(
        title: 'Elaa fahem ',
        soustitre: 'Posted 5mins ago',
        imageUrl:
        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        text:'bla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla bla',
        onPressed: () {  }

    ),
    ListItem(
        title: 'wissal ',
        soustitre: 'Posted 5mins ago',
        imageUrl:
        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        text:'bla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla bla',
        onPressed: () {  }

    ),
    ListItem(
        title: 'maram ',
        soustitre: 'Posted 5mins ago',
        imageUrl:
        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        text:'bla bla bla bla bla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla bla',
        onPressed: () {  }
    ),
  ];
  String _searchQuery = '';

  List<ListItem> _getFilteredItems(String query) {
    return _listItems
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(


        appBar: header(context,titleText: 'Home'),
        drawer: myDrawer(child: ListView()),
          body:Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextField(

                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: "Searching for ...",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (query) {
                            setState(() {
                              _searchQuery = query;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {
                        // Logique de filtrage ici
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: _getFilteredItems(_searchQuery)
                        .map((item) =>Padding(
                          padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
    child:Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.0, 0.5),
                                ),
                              ],
                            ),

                      padding: EdgeInsets.fromLTRB(1, 1, 1, 16),
                      child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.0, 0.5),
                                  ),
                                ],
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      CircleAvatar(
                                         backgroundImage: NetworkImage(
                                          item.imageUrl
                                        ),
                                      ),
                                    SizedBox(
                                      width: 20,
                                    ),


      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(item.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,fontFamily: 'Poppins'),),
        SizedBox(height: 5.0),
        Text(item.soustitre),
      ],

      ),
                                  ],
                                ),

                              ),
                            ),
                            SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.text),
                                  SizedBox(height: 15,),
                                 Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [

                                        ],
                                      ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(420.0, 30.0),

      ),

    onPressed: _showDialog,
    child: Text('Contact the provider'),

    ),
    ),



                                ],
                              ),
                            ),
    ],
                      ),

                    ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Portfolio()),
        );
      },
                        ),
                    ),
    )
                        .toList(),
                  ),
                ),
              ],
            ),


          ),

      ),

    ) ;
  }
}




