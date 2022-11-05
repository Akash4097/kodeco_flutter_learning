import 'dart:convert';

class Course {
  final String id;
  final String name;
  final String description;

  Course({
    required this.id,
    required this.name,
    required this.description,
  });

  Course copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());

  Course.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String;

  @override
  String toString() =>
      'Course(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant Course other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
