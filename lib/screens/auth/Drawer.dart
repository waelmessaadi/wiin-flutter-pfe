

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/screens/auth/posts_screen.dart';

class myDrawer extends StatefulWidget {
  myDrawer({Key? key, required ListView child}):super(key:key);
  @override
  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  late String _selectedLanguage;
  final List<String> _languages = ['English', 'French', 'Arabic'];
  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'English';
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              String name = snapshot.data!.getString('name') ?? '';
              String email = snapshot.data!.getString('email') ?? '';
              return UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: const Text('Add New Post'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Post()),
              );
            },
          ),
          ListTile(
            leading:Icon(Icons.message_outlined),
            title: const Text('Messages'),
            onTap: () {
              //  Navigator.pushNamed(context, '/deuxieme');
            },
          ),
          ListTile(
            leading: Icon(Icons.question_mark_rounded),
            title: const Text('FAQs'),
            onTap: () {
              //Navigator.pushNamed(context, '/deuxieme');
            },
          ),
          ListTile(
            leading: Icon(Icons.note_outlined),
            title: const Text('Terms & Conditions'),
            onTap: () {
              // Navigator.pushNamed(context, '/quatrieme');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone_rounded),
            title: const Text('Contact Us'),
            onTap: () {
              //Navigator.pushNamed(context, '/quatrieme');
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: const Text('Languages'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('language', newValue!);
                setState(() {
                  _selectedLanguage = newValue;
                });
                // TODO: Redémarrer l'application pour appliquer les changements de langue
              },
              items: _languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm logout'),
                    content: Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Supprimer les données avec SharedPreferences
                          Navigator.pop(context);
                          // TODO: Naviguer vers l'écran de connexion
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );



  }
}
