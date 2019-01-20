import 'package:flutter/material.dart';

import '../pages/leaf.dart';

class LeafCard extends StatelessWidget {
  final BuildContext context;
  final Map<String, dynamic> plant;
  final int plantIndex;

  LeafCard(this.context, this.plant, this.plantIndex);

  Widget _buildFavoriteButton() {
    return GestureDetector(
      onDoubleTap: () {
        // TODO to favorite list
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Icon(Icons.favorite_border),
      ),
    );
  }

  Widget _buildInfoButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Leaf(plant)));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Icon(Icons.info_outline),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Image.asset(plant['image_url']),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                _buildTitle(plant['name']),
                Expanded(child: Container()),
                _buildInfoButton(),
                SizedBox(
                  width: 10.0,
                ),
                _buildFavoriteButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
