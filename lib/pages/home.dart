import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/home_drawer.dart';
import '../widgets/project_card.dart';

import '../models/project.dart';

class HomePage extends StatefulWidget {
  final Function getDummyData;
  final Function deleteProject;

  HomePage(this.getDummyData, this.deleteProject);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState(getDummyData, deleteProject);
  }
}

class _HomePageState extends State<HomePage> {
  final Function getDummyData;
  final Function deleteProject;
  final Random rnd = Random();
  List<Project> projects;

  _HomePageState(this.getDummyData, this.deleteProject) {
    projects = getDummyData();
  }

  Widget _buildProjectList() {
    Widget projectList;
    if (projects.length > 0) {
      projectList = ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
                child: Column(
              children: <Widget>[
                ProjectCard(context, projects[index], index, deleteProject),
              ],
            )),
        itemCount: projects.length,
      );
    } else {
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
    projects = getDummyData();
    return Scaffold(
      appBar: _buildHomeAppBar(),
      drawer: _buildSideDrawer(context),
      body: _buildBody(),
    );
  }
}
