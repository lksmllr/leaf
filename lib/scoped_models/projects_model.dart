import 'package:scoped_model/scoped_model.dart';

import '../models/project.dart';
import '../models/leaf.dart';
import '../models/user.dart';

class ConnectedProjectsModel extends Model {
  List<Project> _projects = [
    Project(
      projectName: 'init',
      leafs: [Leaf(imageURL: './assets/leaf.png')]),
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
  int _selProductIndex;
  User _authenticatedUser;
}

class ProjectModel extends ConnectedProjectsModel {
  List<Project> get allProjects {
    return List.from(_projects);
    //return _projects;
  }

  void addProject(Project project) {
    _projects.add(project);
  }

  void deleteProject(int index) {
    _projects.removeAt(index);
  }

}

class UserModel extends ConnectedProjectsModel {
  void login(String email, String password) {
    _authenticatedUser = User(id: '01234', email: email, password: password);
  }
}
