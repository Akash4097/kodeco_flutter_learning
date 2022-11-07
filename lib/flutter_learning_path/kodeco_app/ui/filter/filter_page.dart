import 'package:flutter/material.dart';
import '../../state/filter_state_container.dart';
import '../../constants.dart';
import 'filter_widget.dart';
import '../../strings.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }

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
            groupValue: state.filterValue,
            text: Strings.all,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.androidFilter,
            groupValue: state.filterValue,
            text: Strings.android,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.iosFilter,
            groupValue: state.filterValue,
            text: Strings.ios,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.flutterFilter,
            groupValue: state.filterValue,
            text: Strings.flutter,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.archivedFilter,
            groupValue: state.filterValue,
            text: Strings.archived,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.unityFilter,
            groupValue: state.filterValue,
            text: Strings.unity,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.macosFilter,
            groupValue: state.filterValue,
            text: Strings.macos,
            onChanged: onValueChange,
          ),
          FilterWidget(
            value: Constants.sssFilter,
            groupValue: state.filterValue,
            text: Strings.sss,
            onChanged: onValueChange,
          ),
        ],
      ),
    );
  }

  void onValueChange(int? value) async {
    state.updateFilterValue(value ?? 0);
  }
}
