

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Widgets/header.dart';
import 'Drawer.dart';

class Post extends StatefulWidget {
  Post({Key? key}):super(key:key);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String _title = '';
  String _description = '';
  File? _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: header(context,titleText: 'New Post'),

        body:  SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
        key: _formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        TextFormField(
        decoration: InputDecoration(labelText: 'Title'),
        validator: (value) {
        if (value!.isEmpty) {
        return 'Please enter a title';
        }
        return null;
        },
        onSaved: (value) {
        _title = value!;
        },
        ),
        TextFormField(
        decoration: InputDecoration(labelText: 'Description'),
    maxLines: 3,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter a description';
    }
    return null;
    },
    onSaved: (value) {
    _description = value!;
    },
    ),
    SizedBox(height: 20),
    _image == null
    ? Text('No image selected.')
        : Image.file(
    _image!,
    height: 200,
    ),
    ElevatedButton(
    onPressed: _selectImage,
    child: Text('Select Image'),
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed: _submitForm,
    child: Text('Add Publication'),
    ),
    ],
    ),
    ),
    ),
    ),
    ));
  }

  void _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Code to add the publication to the database or perform other actions
      // with the input values
      print('Title: $_title');
      print('Description: $_description');
      print('Image path: ${_image?.path}');

      // Navigate back to the previous screen
      Navigator.of(context).pop();
    }
  }
}
