import 'package:flutter/material.dart';

import '../models/project.dart';
import '../scoped_models/main.dart';

class LeafsPage extends StatelessWidget {
  final BuildContext context;
  final MainModel model;
  final Project project;

  LeafsPage(
      {@required this.context, @required this.model, @required this.project});

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
          title: Text(project.projectName),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(10.0), child: _buildListOfLeafs()),
        ));
  }
}
