import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/home_drawer.dart';
import '../models/project.dart';
import '../models/leaf.dart';
import '../scoped_models/main.dart';
import '../pages/leaf.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final Random rnd = Random();

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

  Widget _buildProjectsListsTile(
      BuildContext context, MainModel model, Project project) {
    List<Leaf> images = project.leafs;
    int num_images = images.length;
    String image_url;

    if (num_images > 0) {
      image_url = images[project.leafs.length - 1].imageURL;
    } else {
      image_url = './assets/leaf.png';
    }
    
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage(image_url),
          ),
          title: Text(project.projectName),
          subtitle: Text('${project.leafs.length} leafs in here'),
          trailing: IconButton(
            iconSize: 25.0,
            icon: Icon(Icons.edit),
            onPressed: () {
              print('TODO: Edit Projects');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LeafsPage(
                        model: model,
                        context: context,
                        project: project,
                      ),
                ),
              );
            },
          ),
        ),
        Divider(),
      ],
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
              return Container(
                child: Column(
                  children: <Widget>[
                    Dismissible(
                      key: Key(index.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction) {
                        if (direction == DismissDirection.endToStart) {
                          
                          setState(() {
                            model.deleteProject(index);
                            print('num projects after dismissal: ' + model.allProjects.length.toString());
                          });
                          
                          //model.deleteProject(index);
                        } else {
                          print(direction);
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
                      child: _buildProjectsListsTile(context, model, project),
                    )
                  ],
                ),
              );
            },
            itemCount: model.allProjects.length,
            //reverse: true,
          );
        },
      ),
    );
  }

  Widget _buildHomeAppBar(String title) {
    return AppBar(
      title: Center(child: Text(title)),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.create_new_folder),
          onPressed: () {/*TODO*/},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {/*TODO*/},
        ),
        //SizedBox(width: 10.0,),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {/*TODO*/},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeAppBar('Projects'),
      drawer: _buildSideDrawer(context),
      body: _buildBody(),
    );
  }
}
