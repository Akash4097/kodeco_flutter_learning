import 'package:flutter/material.dart';
import 'strings.dart';
import 'ui/courses/course_page.dart';

class KodecoApp extends StatelessWidget {
  const KodecoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: const CoursePage(),
    );
  }
}
