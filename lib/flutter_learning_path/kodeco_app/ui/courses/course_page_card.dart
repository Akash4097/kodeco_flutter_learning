import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../model/course.dart';
import '../course_details/course_detail_page.dart';

class CoursePageCard extends StatelessWidget {
  final Course course;
  const CoursePageCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              children: [
                Image.network(course.artworkUrl),
                Positioned(
                  bottom: 8.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.deepOrange[400],
                      ),
                      child: Text(
                        course.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      openBuilder: (context, action) {
        return CourseDetailPage(course: course);
      },
    );
  }
}
