import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final BuildContext context;
  final Function deleteProductAt;
  final int index;
  final Project project;

  ProjectCard(this.context, this.project, this.index, this.deleteProductAt);
  @override
  Widget build(BuildContext context) {
    int lastImgInList = project.leafs.length - 1;
    int numImgs = project.leafs.length;
    return Dismissible(
      key: Key(index.toString()),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          deleteProductAt(index);
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
              backgroundImage:
                  AssetImage(project.leafs[lastImgInList].imageURL),
            ),
            title: Text(project.projectName),
            subtitle: Text('$numImgs leafs in here'),
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
    );
  }
}
