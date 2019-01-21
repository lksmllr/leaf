import 'package:flutter/material.dart';

class Leaf extends StatelessWidget {
  final Map<String, dynamic> leaf;

  Leaf(this.leaf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(leaf['image_url']),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                child: Image.asset(leaf['image_url']),
              )),
        ));
  }
}
