// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['name'] as String,
    json['location'] as String,
    stringToDate(json['joined_at'] as String),
    json['anime_statistics'] == null
        ? null
        : AnimeStatistics.fromJson(
            json['anime_statistics'] as Map<String, dynamic>),
  );
}
