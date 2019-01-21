import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/home.dart';

import './models/project.dart';
import './models/leaf.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _MyAppState();
    }
}

class _MyAppState extends State<MyApp> {
  // dummy data
  final List<Project> projects = [
    Project(
      projectName: 'test0',
      leafs: [Leaf(imageURL: './assets/stones.jpg')],
    ),
    Project(
      projectName: 'test1',
      leafs: [
        Leaf(imageURL: './assets/example2.png'),
        Leaf(imageURL: './assets/example1.png')
      ],
    ),
    Project(
      projectName: 'test2',
      leafs: [
        Leaf(imageURL: './assets/example1.png'),
        Leaf(imageURL: './assets/example2.png'),
        Leaf(imageURL: './assets/example3.png')
      ],
    ),
  ];

  void _deleteProject(int index) {
    //setState(() {
      projects.removeAt(index);
    //});
  }

  List<Project> _getDummyData() {
    return projects;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leaf',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (BuildContext context) => AuthPage(_getDummyData, _deleteProject),
        '/home': (BuildContext context) => HomePage(_getDummyData, _deleteProject),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(_getDummyData, _deleteProject));
      },
    );
  }
}
