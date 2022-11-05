import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';
import 'course_controller.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final _controller = CourseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Course>>(
        future: _controller.fetchCourses(Constants.allFilter),
        builder: (context, snapshot) {
          final course = snapshot.data;

          if (course == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const Center(
            child: Text("Kodeco App Courses Fetched Successfully!"),
          );
        },
      ),
    );
  }
}
