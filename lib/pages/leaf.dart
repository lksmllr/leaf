import 'package:flutter/material.dart';

import '../models/project.dart';
import '../scoped_models/main.dart';

class LeafsPage extends StatelessWidget {
  final BuildContext context;
  final MainModel model;
  final Project project;

  LeafsPage(
      {@required this.context, @required this.model, @required this.project});

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.contain,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.60), BlendMode.dstATop),
      image: AssetImage('assets/leaf.png'),
    );
  }

  Widget _buildListOfLeafs() {
    //final double _deviceWidth = MediaQuery.of(context).size.width;
    //final double _targetWidth = _deviceWidth * 0.8;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Image.asset(project.leafs[index].imageURL),
            ));
      },
      itemCount: project.leafs.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(project.projectName),),
          actions: <Widget>[
            
            IconButton(
              icon: Icon(Icons.add_a_photo),
              onPressed: () {/*TODO*/},
            ),
            //SizedBox(width: 10.0,),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {/*TODO*/},
            ),
          ],
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(image: _buildBackgroundImage()),
              padding: EdgeInsets.all(10.0),
              child: _buildListOfLeafs()),
        ));
  }
}
