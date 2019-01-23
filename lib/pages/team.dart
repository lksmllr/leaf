import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.contain,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.60), BlendMode.dstATop),
      image: AssetImage('assets/leaf.png'),
    );
  }

  Widget _buildHomeAppBar(BuildContext context) {
    return AppBar(
      title: Text('Team'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: _buildBackgroundImage(),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('./assets/profile_pic.png'),
            ),
            title: Text('Developer 0'),
            subtitle: Text('intelligent guy'),
            trailing: IconButton(
              icon: Icon(Icons.open_in_new, color: Theme.of(context).primaryColor),
              onPressed: () {/* TODO */},
            ),
          ),
          SizedBox(height: 10.0,),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('./assets/profile_pic.png'),
            ),
            title: Text('Developer 1'),
            subtitle: Text('more intelligent guy'),
            trailing: IconButton(
              icon: Icon(Icons.open_in_new, color: Theme.of(context).primaryColor),
              onPressed: () {/* TODO */},
            ),
          ),
          SizedBox(height: 10.0,),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('./assets/profile_pic.png'),
            ),
            title: Text('Developer 2'),
            subtitle: Text('most intelligent guy'),
            trailing: IconButton(
              icon: Icon(Icons.open_in_new, color: Theme.of(context).primaryColor),
              onPressed: () {/* TODO */},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeAppBar(context),
      body: _buildBody(context),
    );
  }
}
