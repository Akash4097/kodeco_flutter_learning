import '../../model/course.dart';
import '../../repository/repository.dart';

class CourseController {
  final Repository repository;

  CourseController(this.repository);

  Future<List<Course>> fetchCourses(int domainFilter) =>
      repository.getCourses(domainFilter);
}
