import 'package:flutter/material.dart';
import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/ui/course_details/course_detail_page.dart';
import '../../repository/course_repository.dart';
import '../../constants.dart';
import '../../model/course.dart';
import 'course_controller.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final _controller = CourseController(CourseRepository());

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

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: course.length,
            itemBuilder: (context, index) {
              return _buildRow(
                course[index],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            course.name,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(course.artworkUrl),
        ),
        subtitle: Text(course.domainString),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CourseDetailPage(course: course),
            ),
          );
        },
      ),
    );
  }
}
