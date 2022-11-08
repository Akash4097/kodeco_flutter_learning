import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'image_container.dart';
import '../../model/course.dart';
import '../../utils/string_extension.dart';

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
      body: ListView(
        children: [
          _buildBanner(),
          _buildMain(context),
          _buildDetails(context),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 32.0, left: 24.0, right: 24.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(double.infinity, 52.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                side: const BorderSide(color: Colors.deepOrange),
              ),
              onPressed: () => _launchCourse(course.id),
              child: const Text(
                "View Course",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBanner() => Hero(
        tag: "cardArtwork-${course.id}",
        child: ImageContainer(
          height: 300,
          url: course.artworkUrl,
        ),
      );

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.name,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 24),
          ),
          Text(
            course.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Domains: ${course.domainString}",
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            "Level: ${course.difficulty?.capitalize()}",
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            "${course.contributor}",
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  void _launchCourse(String courseId) {
    launchUrl(Uri.parse("https://raywenderlich.com/$courseId"));
  }
}
