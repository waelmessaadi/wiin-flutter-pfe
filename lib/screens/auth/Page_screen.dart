import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/auth/posts_screen.dart';
import 'package:untitled/screens/auth/profile_screen.dart';
import 'package:intl/intl.dart';
import 'home_screen.dart';
import 'messages_screen.dart';

class pagePage extends StatefulWidget {
  pagePage({Key? key}):super(key:key);
  @override
  _pagePageState createState() => _pagePageState();
}

class _pagePageState extends State<pagePage> {
   PageController pageControler=new PageController();
    int pageIndex=0 ;
    onPageChanged(int pageIndex){
      setState(() {
        this.pageIndex=pageIndex;
      });
    }
   onTap(int pageIndex){
      pageControler.jumpToPage(pageIndex);
   }
   @override
   void dispose(){
      super.dispose();
      pageControler.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        children: <Widget>[
          Home(),
          Post(),
          selmi(),
          Profile(),
         ],
        controller: pageControler,
        onPageChanged: onPageChanged,
        physics:NeverScrollableScrollPhysics() ,
      ),
   bottomNavigationBar:CupertinoTabBar(
     currentIndex:pageIndex ,
     activeColor:Theme.of(context).primaryColor ,
     onTap: onTap,
     items: [

       BottomNavigationBarItem(
           icon: Icon(Icons.home),
         label: 'Home',
       ),

       BottomNavigationBarItem(
           icon: Icon(Icons.add_circle_outline),
         label:'New Post'
       ),
       BottomNavigationBarItem(
           icon: Icon(Icons.message_outlined),
       label:'Messages'
       ),
       BottomNavigationBarItem(
           icon: Icon(Icons.person_pin),
       label: 'Profile'
       ),
     ]
   ) ,
    );
  }

}