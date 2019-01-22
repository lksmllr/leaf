import 'package:flutter/material.dart';

import '../pages/about.dart';
import '../pages/howto.dart';
import '../pages/team.dart';
import '../pages/settings.dart';
import '../pages/license.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Menu'),
          ),
          Expanded(
            child: Container(),
          ),
          // ABOUT PAGE
          ListTile(
            leading:
                Icon(Icons.announcement, color: Theme.of(context).primaryColor),
            title: Text(
              'About \"Leaf\"',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => About()));
            },
          ),
          Expanded(
            child: Container(),
          ),
          // HOW TO
          ListTile(
            leading:
                Icon(Icons.help_outline, color: Theme.of(context).primaryColor),
            title: Text(
              'How to',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HowTo()));
            },
          ),
          Expanded(
            child: Container(),
          ),
          // TEAM
          ListTile(
            leading: Icon(Icons.people, color: Theme.of(context).primaryColor),
            title: Text(
              'Team',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TeamPage()));
            },
          ),
          Expanded(
            child: Container(),
          ),
          // LICENSE
          ListTile(
            leading: Icon(Icons.line_weight, color: Colors.grey),
            title: Text(
              'License',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyLicensePage()));
            },
          ),
          Expanded(
            child: Container(),
          ),
          // SETTINGS
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SettingsPage()));
            },
          ),
          Expanded(
            child: Container(),
          ),
          // LOGOUT
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text(
              'LogOut',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
