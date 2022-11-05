import 'dart:convert';

import '../constants.dart';
import '../model/course.dart';
import 'repository.dart';
import 'package:http/http.dart' as http;

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

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final apiResponse = json.decode(response.body) as Map<String, dynamic>;

    return courses;
  }
}