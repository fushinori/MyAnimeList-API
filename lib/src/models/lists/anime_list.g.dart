// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeList _$AnimeListFromJson(Map<String, dynamic> json) {
  return AnimeList(
    json['node'] == null
        ? null
        : Node.fromJson(json['node'] as Map<String, dynamic>),
    json['list_status'] == null
        ? null
        : MyAnimeListStatus.fromJson(
            json['list_status'] as Map<String, dynamic>),
  );
}
