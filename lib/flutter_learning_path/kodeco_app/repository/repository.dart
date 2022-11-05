import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/model/course.dart';

abstract class Repository {
  Future<List<Course>> getCourses(int domainFilter);
}
