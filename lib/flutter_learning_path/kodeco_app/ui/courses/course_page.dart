import 'package:flutter/material.dart';
import 'course_page_card.dart';
import '../../state/filter_state_container.dart';
import '../../repository/course_repository.dart';
import '../../model/course.dart';
import 'course_controller.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final _controller = CourseController(CourseRepository());
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Course>>(
        future: _controller.fetchCourses(state.filterValue),
        builder: (context, snapshot) {
          final course = snapshot.data;

          if (course == null ||
              (snapshot.connectionState != ConnectionState.done)) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: course.length,
            itemBuilder: (context, index) {
              return CoursePageCard(course: course[index]);
            },
          );
        },
      ),
    );
  }
}
