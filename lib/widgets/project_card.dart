import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final BuildContext context;
  double imgHeight;
  double imgWidth;
  final Map<String, dynamic> project;
  List<Map<String, dynamic>> images;

  ProjectCard(this.context, this.project) {
    this.images = project['images'];
    imgWidth = MediaQuery.of(context).size.width * 0.8;
    imgHeight = imgWidth;
  }

  DecorationImage _buildBackgroundImage(String path) {
    return DecorationImage(
      fit: BoxFit.fill,
      colorFilter:
          ColorFilter.mode(Colors.white.withOpacity(1.0), BlendMode.dstATop),
      image: AssetImage(path),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            height: imgHeight,
            width: imgWidth,
            decoration: BoxDecoration(
                //color: Theme.of(context).primaryColor,
                //color: Colors.grey,
                //border: Border.all(color: Colors.grey, width: 1.5),
                image: _buildBackgroundImage(images[0]['image_url']),
                borderRadius: BorderRadius.circular(4.0)),
            //child: Image.asset('./assets/stones.jpg'),
            //child: Image.asset(images[0]['image_url']),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(project['project_name'],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black)),
                          ),
                          SizedBox(width: 5.0,),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                                // TODO ontap
                            child: Icon(Icons.edit,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
