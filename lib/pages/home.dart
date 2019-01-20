import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/drawer_list_tile.dart';
import '../widgets/leaf_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final Random rnd = Random();
  final List<Map<String, dynamic>> plants = [
    {'name': 'Stones', 'image_url': './assets/stones.jpg'},
  ];

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Menu'),
          ),
          Expanded(
            child: Container(),
          ),
          DrawerListTile(Icon(Icons.settings), 'Settings', '/settings'),
          DrawerListTile(Icon(Icons.exit_to_app), 'LogOut', '/'),
        ],
      ),
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.contain,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.60), BlendMode.dstATop),
      image: AssetImage('assets/leaf.png'),
    );
  }

  Widget _buildPlantList() {
    Widget leafCards;
    if (plants.length > 0) {
      leafCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            LeafCard(context, plants[index], index),
        itemCount: plants.length,
      );
    } else {
      leafCards = Container();
    }
    return leafCards;
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        image: _buildBackgroundImage(),
      ),
      padding: EdgeInsets.all(10.0),
      child: _buildPlantList(),
    );
  }

  Widget _buildHomeAppBar() {
    return AppBar(
      title: Text('My Leafs'),
      actions: <Widget>[
        GestureDetector(
            onTap: () {
              // TODO add new Card
              print('Add new card!');
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    Text('Leaf', style: TextStyle(fontSize: 15.0)),
                  ],
                )))
      ],
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
