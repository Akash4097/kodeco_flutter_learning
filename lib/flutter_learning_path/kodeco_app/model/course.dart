import 'package:kodeco_flutter_learning/flutter_learning_path/kodeco_app/constants.dart';

import 'domain.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final String? difficulty;
  final String? contributor;
  final String artworkUrl;
  final List<Domain> domains;
  Course({
    required this.artworkUrl,
    required this.id,
    required this.name,
    required this.description,
    required this.domains,
    this.difficulty,
    this.contributor,
  });

  Course.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String,
        artworkUrl = json['attributes']['card_artwork_url'] as String,
        difficulty = json['attributes']['difficulty'] as String?,
        contributor = json['attributes']['contributor_string'] as String?,
        domains = [] {
    final domainData =
        json['relationships']['domains']['data'] as List<dynamic>;
    if (domainData.isNotEmpty) {
      for (var i = 0; i < domainData.length; i++) {
        final domain = Course.getDomain(
            json['relationships']['domains']['data'][i]['id'] as String);
        domains.add(domain);
      }
    }
  }

  static Domain getDomain(String domainId) {
    switch (domainId) {
      case Constants.androidDomain:
        return Domain.android;
      case Constants.iosDomain:
        return Domain.ios;
      case Constants.macosDomain:
        return Domain.macos;
      case Constants.archivedDomain:
        return Domain.archived;
      case Constants.flutterDomain:
        return Domain.flutter;
      case Constants.unityDomain:
        return Domain.unity;
      case Constants.sssDomain:
        return Domain.sss;
      default:
        return Domain.unkown;
    }
  }

  String get domainString {
    String res = "";
    for (var element in domains) {
      res += "${element.name}, ";
    }
    return res;
  }

  @override
  String toString() =>
      'Course(id: $id, name: $name, description: $description, difficulty: $difficulty, contributor: $contributor, artworkUrl: $artworkUrl, domains: $domains)';
}
