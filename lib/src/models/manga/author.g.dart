// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    json['node'] == null
        ? null
        : AuthorNode.fromJson(json['node'] as Map<String, dynamic>),
    json['role'] as String?,
  );
}
