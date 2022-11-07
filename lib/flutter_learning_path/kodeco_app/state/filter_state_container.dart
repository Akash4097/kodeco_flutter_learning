import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class FilterStateContainer extends StatefulWidget {
  final Widget child;
  const FilterStateContainer({
    super.key,
    required this.child,
  });

  @override
  State<FilterStateContainer> createState() => FilterState();

  static FilterState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_FilterInheritedWidget>()!
      .state;
}

class FilterState extends State<FilterStateContainer> {
  int filterValue = Constants.allFilter;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      setState(() {
        filterValue = _prefs.getInt(Constants.filterKey) ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _FilterInheritedWidget(state: this, child: widget.child);
  }

  void updateFilterValue(int value) {
    setState(() {
      _prefs.setInt(Constants.filterKey, value);
      filterValue = value;
    });
  }
}

class _FilterInheritedWidget extends InheritedWidget {
  final FilterState state;

  const _FilterInheritedWidget({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
