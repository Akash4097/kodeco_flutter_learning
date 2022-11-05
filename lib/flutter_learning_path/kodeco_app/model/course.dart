class Course {
  final String id;
  final String name;
  final String description;
  final String? difficulty;
  final String? contributor;
  final String artworkUrl;
  Course({
    required this.artworkUrl,
    required this.id,
    required this.name,
    required this.description,
    this.difficulty,
    this.contributor,
  });

  Course.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String,
        artworkUrl = json['attributes']['card_artwork_url'] as String,
        difficulty = json['attributes']['difficulty'] as String?,
        contributor = json['attributes']['contributor_string'] as String?;

  @override
  String toString() =>
      'Course(id: $id, name: $name, description: $description, difficulty: $difficulty, contributor: $contributor, artworkUrl: $artworkUrl)';
}
