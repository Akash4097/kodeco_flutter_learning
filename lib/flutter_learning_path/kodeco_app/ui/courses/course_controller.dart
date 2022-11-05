import '../../model/course.dart';
import '../../repository/course_repository.dart';
import '../../repository/repository.dart';

class CourseController {
  final Repository repository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) =>
      repository.getCourses(domainFilter);
}
