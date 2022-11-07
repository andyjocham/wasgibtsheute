// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListItem {
  final String name;

  ListItem({required this.name});

  ListItem copyWith({
    String? name,
  }) {
    return ListItem(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory ListItem.fromMap(Map<String, dynamic> map) {
    return ListItem(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListItem.fromJson(String source) =>
      ListItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListItem(name: $name)';

  @override
  bool operator ==(covariant ListItem other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
