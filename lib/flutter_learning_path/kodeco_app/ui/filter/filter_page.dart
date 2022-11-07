import 'package:flutter/material.dart';
import '../../constants.dart';
import 'filter_widget.dart';
import '../../strings.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int _filterValue = Constants.allFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.filter),
      ),
      body: Column(
        children: [
          FilterWidget(
            value: Constants.allFilter,
            groupValue: _filterValue,
            text: Strings.all,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.androidFilter,
            groupValue: _filterValue,
            text: Strings.android,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.iosFilter,
            groupValue: _filterValue,
            text: Strings.ios,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.flutterFilter,
            groupValue: _filterValue,
            text: Strings.flutter,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.archivedFilter,
            groupValue: _filterValue,
            text: Strings.archived,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.unityFilter,
            groupValue: _filterValue,
            text: Strings.unity,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.macosFilter,
            groupValue: _filterValue,
            text: Strings.macos,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.sssFilter,
            groupValue: _filterValue,
            text: Strings.sss,
            onChanged: onValueChange,
          ),
        ],
      ),
    );
  }

  void onValueChange(int? value) {
    setState(() {
      _filterValue = value ?? 0;
    });
  }
}
