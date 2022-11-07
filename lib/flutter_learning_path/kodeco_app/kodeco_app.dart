import 'package:flutter/material.dart';
import 'ui/filter/filter_page.dart';
import 'strings.dart';
import 'ui/courses/course_page.dart';

class KodecoApp extends StatelessWidget {
  const KodecoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FilterPage(),
                ),
              );
            },
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      body: const CoursePage(),
    );
  }
}
