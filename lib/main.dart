import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import './scoped_models/main.dart';

import './pages/auth.dart';
import './pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        title: 'Leaf',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => HomePage(),
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
              builder: (BuildContext context) => HomePage());
        },
      ),
    );
  }
}
