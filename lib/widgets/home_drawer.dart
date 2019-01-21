import 'package:flutter/material.dart';

import './drawer_list_tile.dart';

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
          //DrawerListTile(null, '', ''),
          Expanded(child: Container(),),
          DrawerListTile(Icon(Icons.announcement, color: Theme.of(context).primaryColor), 'About \"Leaf\"', '/settings'),
          Expanded(child: Container(),),
          DrawerListTile(Icon(Icons.help_outline, color: Theme.of(context).primaryColor), 'How to', '/settings'),          
          Expanded(child: Container(),),
          DrawerListTile(Icon(Icons.people, color: Theme.of(context).primaryColor), 'Team', '/settings'),
          Expanded(child: Container(),),
          DrawerListTile(Icon(Icons.line_weight, color: Colors.grey), 'License', '/'),
          Expanded(child: Container(),),
          DrawerListTile(Icon(Icons.settings, color: Colors.grey), 'Settings', '/settings'),
          Expanded(child: Container(),),
          DrawerListTile(Icon(Icons.exit_to_app, color: Colors.red), 'LogOut', '/'),
          Expanded(child: Container(),),
        ],
      ),
    );
    }
}