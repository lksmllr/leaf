import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/home_drawer.dart';
import '../models/project.dart';
import '../models/leaf.dart';
import '../scoped_models/main.dart';

class HomePage extends StatelessWidget {
  final Random rnd = Random();
  //final List<Project> projects;

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
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final Project project = model.allProjects[index];
              //print(project.leafs.length);

              if (index == 0) {
                // add Project
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            project.leafs[project.leafs.length - 1].imageURL),
                      ),
                      title: Text('New'),
                      subtitle: Text('start growing now!'),
                      trailing: IconButton(
                        iconSize: 25.0,
                        icon: Icon(Icons.arrow_upward, color: Theme.of(context).primaryColor),
                        onPressed: () {
                          print('TODO: Start project');
                        },
                      ),
                    ),
                    Divider(),
                  ],
                );
              } else {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Dismissible(
                        key: Key(index.toString()),
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.endToStart) {
                            model.deleteProject(index);
                          }
                        },
                        background: Container(
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(project
                                    .leafs[project.leafs.length - 1].imageURL),
                              ),
                              title: Text(project.projectName),
                              subtitle:
                                  Text('${project.leafs.length} leafs in here'),
                              trailing: IconButton(
                                iconSize: 25.0,
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  print('TODO: Edit Projects');
                                },
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            },
            itemCount: model.allProjects.length,
            reverse: true,
          );
        },
      ),
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
