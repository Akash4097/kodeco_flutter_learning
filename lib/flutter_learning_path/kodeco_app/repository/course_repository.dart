import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/constants.dart';

import '../model/course.dart';
import 'repository.dart';

class CourseRepository implements Repository {
  String dataURL =
      "https://api.raywenderlich.com/api/contents?filter[content-types][]=collections";

  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    String url = dataURL;

    if (domainFilter != Constants.allFilter) {
      url += ";&filter[domain_ids][]=$domainFilter";
    }
    return courses;
  }
}
