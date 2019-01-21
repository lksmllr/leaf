import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/home_drawer.dart';
import '../widgets/project_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final Random rnd = Random();

  // dummy data
  //final List<Map<String, dynamic>> projects = [];
  
  final List<Map<String, dynamic>> projects = [
    {
      'project_name': 'test0',
      'images': [
        {'index': '0', 'image_url': './assets/stones.jpg'},
      ]
    },
    {
      'project_name': 'test1',
      'images': [
        {'index': '0', 'image_url': './assets/example1.png'},
        {'index': '1', 'image_url': './assets/example2.png'},
        {'index': '2', 'image_url': './assets/example3.png'}
      ]
    },
    {
      'project_name': 'test2',
      'images': [
        {'index': '0', 'image_url': './assets/example2.png'},
        {'index': '1', 'image_url': './assets/example3.png'},
        {'index': '2', 'image_url': './assets/example1.png'}
      ]
    },
    {
      'project_name': 'test3',
      'images': [
        {'index': '0', 'image_url': './assets/example3.png'},
        {'index': '1', 'image_url': './assets/example1.png'},
        {'index': '2', 'image_url': './assets/example2.png'}
      ]
    },
  ];
  

  Widget _buildProjectList() {
    Widget projectList;
    if (projects.length > 0) {
      projectList = ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
                child: Column(
              children: <Widget>[
                ProjectCard(context, projects[index]),
                //Divider(color: Theme.of(context).primaryColor,),
              ],
            )),
        itemCount: projects.length,
      );
    } else {
      // TODO Display Add Button
      projectList = Center(
          child: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        onPressed: () {},
      ));
    }
    return projectList;
  }

  Widget _buildSideDrawer(BuildContext context) {
    return HomeDrawer();
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.contain,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.60), BlendMode.dstATop),
      image: AssetImage('assets/leaf.png'),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        image: _buildBackgroundImage(),
      ),
      padding: EdgeInsets.all(10.0),
      child: _buildProjectList(),
    );
  }

  Widget _buildHomeAppBar() {
    return AppBar(
      title: Text('My leafs'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeAppBar(),
      drawer: _buildSideDrawer(context),
      body: _buildBody(),
    );
  }
}
