// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animelist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeListResponse _$AnimeListResponseFromJson(Map<String, dynamic> json) {
  return AnimeListResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : AnimeList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
