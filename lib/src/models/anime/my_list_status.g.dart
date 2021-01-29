// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAnimeListStatus _$MyAnimeListStatusFromJson(Map<String, dynamic> json) {
  return MyAnimeListStatus(
    json['status'] as String,
    json['score'] as int,
    json['num_episodes_watched'] as int,
    json['is_rewatching'] as bool,
    stringToDate(json['updated_at'] as String),
  );
}
