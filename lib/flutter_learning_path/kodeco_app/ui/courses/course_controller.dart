import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/model/course.dart';
import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/repository/course_repository.dart';
import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/repository/repository.dart';

class ClassController {
  final Repository repository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) =>
      repository.getCourses(domainFilter);
}
