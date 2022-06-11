// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class PhotoModel {
  final String id;
  final String color;
  final Map urls;
  PhotoModel({
    required this.id,
    required this.color,
    required this.urls,
  });

  PhotoModel copyWith({
    String? id,
    String? color,
    Map? urls,
  }) {
    return PhotoModel(
      id: id ?? this.id,
      color: color ?? this.color,
      urls: urls ?? this.urls,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'urls': urls,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
        id: map['id'] as String,
        color: map['color'] as String,
        urls: Map.from(
          (map['urls'] as Map),
        ));
  }

  String toJson() => json.encode(toMap());

  factory PhotoModel.fromJson(String source) =>
      PhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PhotoModel(id: $id, color: $color, urls: $urls)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is PhotoModel &&
        other.id == id &&
        other.color == color &&
        mapEquals(other.urls, urls);
  }

  @override
  int get hashCode => id.hashCode ^ color.hashCode ^ urls.hashCode;
}
