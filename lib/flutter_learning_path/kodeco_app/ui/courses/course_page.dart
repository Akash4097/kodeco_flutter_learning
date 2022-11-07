import 'package:flutter/material.dart';
import '../../state/filter_state_container.dart';
import '../course_details/course_detail_page.dart';
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
        trailing: Hero(
          tag: "cardArtwork-${course.id}",
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(course.artworkUrl),
          ),
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
