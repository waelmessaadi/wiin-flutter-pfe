import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/Widgets/header.dart';

import 'home_screen.dart';
class Portfolio extends StatefulWidget {
  Portfolio({Key? key}):super(key:key);
  @override
  _PortfolioState createState() => _PortfolioState();
}
class ListItem {
  final String imageUrl;
  final String title;
  final   String text;

  ListItem({required this.imageUrl,required this.title ,required this.text});
}
class _PortfolioState extends State<Portfolio> {
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
  String _selectedFilter = 'Tous';
  final List<ListItem> _listItems = [
  ListItem(
  imageUrl:
  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  title: 'first work ',
  text:'bla bla bla blabla bla bla',


  ),
  ListItem(
  imageUrl:
  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  title: 'first work ',
  text:'bla bla bla blabla bla ',


  ),
  ListItem(
  imageUrl:
  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  title: 'first work ',
  text:'bla bla bla blabla bla blabla',


  ),
    ListItem(
      imageUrl:
      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'first work ',
      text:'bla bla bla blabla bla bla bla',


    ),
    ListItem(
      imageUrl:
      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'first work ',
      text:'bla bla bla blabla bla ',


    ),
    ListItem(
      imageUrl:
      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'first work ',
      text:'bla bla bla blabla bla blabla',


    )];
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Scaffold(
        appBar: header(context, titleText: 'Portfolio'),
    body: Column(
    children: <Widget>[
    Container(
    padding: EdgeInsets.all(10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Align(
    alignment: Alignment.topLeft,
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
    ),
    ),
    SizedBox(width: 10),
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
    SizedBox(height: 14),
    Divider(color: Colors.grey),

      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: (_listItems.length / 3).ceil(),
        itemBuilder: (BuildContext context, int index) {
          int startIndex = index * 3;
          int endIndex = (index + 1) * 3;

          if (endIndex > _listItems.length) {
            endIndex = _listItems.length;
          }

          List<ListItem> sublist = _listItems.sublist(startIndex, endIndex);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: sublist
                .map(
                  (item) => Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        item.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        item.text,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            )
                .toList(),
          );
        },
      ),

    ],
    ),
    ),
    ],
    ),
        ),
    );
  }
}
