// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mangalist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaListResponse _$MangaListResponseFromJson(Map<String, dynamic> json) {
  return MangaListResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : MangaList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
