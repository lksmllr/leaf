import 'package:flutter/material.dart';

class About extends StatelessWidget {
  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.contain,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.60), BlendMode.dstATop),
      image: AssetImage('assets/leaf.png'),
    );
  }

  Widget _buildHomeAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeAppBar('About'),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
