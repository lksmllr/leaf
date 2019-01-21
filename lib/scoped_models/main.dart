import 'package:scoped_model/scoped_model.dart';

import './projects_model.dart';

class MainModel extends Model with ConnectedProjectsModel , UserModel, ProjectModel {
}
