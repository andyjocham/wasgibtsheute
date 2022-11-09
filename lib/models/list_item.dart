// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListItem {
  final int? id;
  final String name;

  ListItem({
    this.id,
    required this.name,
  });

  ListItem copyWith({
    int? id,
    String? name,
  }) {
    return ListItem(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ListItem.fromMap(Map<String, dynamic> map) {
    return ListItem(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListItem.fromJson(String source) =>
      ListItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListItem(id: $id, name: $name)';

  @override
  bool operator ==(covariant ListItem other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
