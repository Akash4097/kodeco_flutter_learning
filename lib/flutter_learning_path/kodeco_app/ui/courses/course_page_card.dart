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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CourseDetailPage(course: course),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: [
              Hero(
                tag: "cardArtwork-${course.id}",
                child: Image.network(course.artworkUrl),
              ),
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
                      color: Colors.black.withAlpha(80),
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
      ),
    );
    ;
  }
}



// ListTile(
//         title: Padding(
//           padding: const EdgeInsets.only(bottom: 8.0),
//           child: Text(
//             course.name,
//             style: const TextStyle(fontSize: 18.0),
//           ),
//         ),
//         trailing: Hero(
//           tag: "cardArtwork-${course.id}",
//           transitionOnUserGestures: true,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image.network(course.artworkUrl),
//           ),
//         ),
//         subtitle: Text(course.domainString),
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (_) => CourseDetailPage(course: course),
//             ),
//           );
//         },
//       )