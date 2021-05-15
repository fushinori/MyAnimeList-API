// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
    json['id'] as int?,
    json['title'] as String?,
    json['main_picture'] == null
        ? null
        : MainPicture.fromJson(json['main_picture'] as Map<String, dynamic>),
    json['alternative_titles'] == null
        ? null
        : AlternativeTitles.fromJson(
            json['alternative_titles'] as Map<String, dynamic>),
    stringToDate(json['start_date'] as String?),
    stringToDate(json['end_date'] as String?),
    json['synopsis'] as String?,
    (json['mean'] as num?)?.toDouble(),
    json['rank'] as int?,
    json['popularity'] as int?,
    json['num_list_users'] as int?,
    json['num_scoring_users'] as int?,
    json['nsfw'] as String?,
    stringToDate(json['created_at'] as String?),
    stringToDate(json['updated_at'] as String?),
    json['media_type'] as String?,
    json['status'] as String?,
    (json['genres'] as List?)
        ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['my_list_status'] == null
        ? null
        : MyAnimeListStatus.fromJson(
            json['my_list_status'] as Map<String, dynamic>),
    json['num_episodes'] as int?,
    json['start_season'] == null
        ? null
        : StartSeason.fromJson(json['start_season'] as Map<String, dynamic>),
    json['broadcast'] == null
        ? null
        : Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
    json['source'] as String?,
    json['average_episode_duration'] as int?,
    json['rating'] as String?,
    (json['pictures'] as List?)
        ?.map((e) => Picture.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['background'] as String?,
    (json['related_anime'] as List?)
        ?.map((e) => Relation.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['related_manga'] as List?)
        ?.map((e) => Relation.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['recommendations'] as List?)
        ?.map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['studios'] as List?)
        ?.map((e) => Studio.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['statistics'] == null
        ? null
        : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
  );
}
