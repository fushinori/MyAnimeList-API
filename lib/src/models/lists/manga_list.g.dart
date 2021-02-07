// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaList _$MangaListFromJson(Map<String, dynamic> json) {
  return MangaList(
    json['node'] == null
        ? null
        : Node.fromJson(json['node'] as Map<String, dynamic>),
    json['list_status'] == null
        ? null
        : MyMangaListStatus.fromJson(
            json['list_status'] as Map<String, dynamic>),
  );
}
