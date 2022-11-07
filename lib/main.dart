import 'package:flutter/material.dart';
import 'flutter_learning_path/kodeco_app/state/filter_state_container.dart';
import 'flutter_learning_path/kodeco_app/strings.dart';
import 'flutter_learning_path/kodeco_app/kodeco_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterStateContainer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const KodecoApp(),
      ),
    );
  }
}
