import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/strings.dart';

enum Domain {
  all,
  android,
  macos,
  ios,
  flutter,
  sss,
  unity,
  archived,
  unkown,
}

extension DomainExtension on Domain {
  String get name {
    switch (this) {
      case Domain.all:
        return Strings.all;
      case Domain.android:
        return Strings.android;
      case Domain.macos:
        return Strings.macos;
      case Domain.ios:
        return Strings.ios;
      case Domain.flutter:
        return Strings.flutter;
      case Domain.sss:
        return Strings.sss;
      case Domain.unity:
        return Strings.unity;
      case Domain.archived:
        return Strings.archived;
      default:
        return Strings.unknown;
    }
  }
}
