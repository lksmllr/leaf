import 'package:flutter/material.dart';

import './leaf.dart';

class Project {
  String projectName;
  List<Leaf> leafs;

  Project({
    @required this.projectName, 
    @required this.leafs});

}