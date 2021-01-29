// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyMangaListStatus _$MyMangaListStatusFromJson(Map<String, dynamic> json) {
  return MyMangaListStatus(
    json['status'] as String,
    json['is_rereading'] as bool,
    json['num_volumes_read'] as int,
    json['num_chapters_read'] as int,
    stringToDate(json['updated_at'] as String),
  );
}
