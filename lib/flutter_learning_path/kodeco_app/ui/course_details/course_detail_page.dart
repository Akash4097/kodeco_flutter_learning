import 'package:flutter/material.dart';
import '../../model/course.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;
  const CourseDetailPage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Container(),
    );
  }
}
