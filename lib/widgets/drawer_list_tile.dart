import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final String route;

  DrawerListTile(this.icon, this.title, this.route);

  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title, style: TextStyle(fontSize: 20.0),),
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}
