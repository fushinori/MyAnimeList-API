// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manga _$MangaFromJson(Map<String, dynamic> json) {
  return Manga(
    json['id'] as int,
    json['title'] as String,
    json['main_picture'] == null
        ? null
        : MainPicture.fromJson(json['main_picture'] as Map<String, dynamic>),
    json['alternative_titles'] == null
        ? null
        : AlternativeTitles.fromJson(
            json['alternative_titles'] as Map<String, dynamic>),
    stringToDate(json['start_date'] as String),
    stringToDate(json['end_date'] as String),
    json['synopsis'] as String,
    (json['mean'] as num)?.toDouble(),
    json['rank'] as int,
    json['popularity'] as int,
    json['num_list_users'] as int,
    json['num_scoring_users'] as int,
    json['nsfw'] as String,
    stringToDate(json['created_at'] as String),
    stringToDate(json['updated_at'] as String),
    json['media_type'] as String,
    json['status'] as String,
    (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['my_list_status'] == null
        ? null
        : MyMangaListStatus.fromJson(
            json['my_list_status'] as Map<String, dynamic>),
    json['num_volumes'] as int,
    json['num_chapters'] as int,
    (json['authors'] as List)
        ?.map((e) =>
            e == null ? null : Author.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['pictures'] as List)
        ?.map((e) =>
            e == null ? null : Picture.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['background'] as String,
    (json['related_anime'] as List)
        ?.map((e) =>
            e == null ? null : Relation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['related_manga'] as List)
        ?.map((e) =>
            e == null ? null : Relation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['recommendations'] as List)
        ?.map((e) => e == null
            ? null
            : Recommendation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['serialization'] as List)
        ?.map((e) => e == null
            ? null
            : Serialization.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
