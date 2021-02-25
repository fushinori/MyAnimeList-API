// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeStatistics _$AnimeStatisticsFromJson(Map<String, dynamic> json) {
  return AnimeStatistics(
    json['num_items_watching'] as int,
    json['num_items_completed'] as int,
    json['num_items_on_hold'] as int,
    json['num_items_dropped'] as int,
    json['num_items_plan_to_watch'] as int,
    json['num_items'] as int,
    (json['num_days_watched'] as num)?.toDouble(),
    (json['num_days_watching'] as num)?.toDouble(),
    (json['num_days_completed'] as num)?.toDouble(),
    (json['num_days_on_hold'] as num)?.toDouble(),
    (json['num_days_dropped'] as num)?.toDouble(),
    (json['num_days'] as num)?.toDouble(),
    json['num_episodes'] as int,
    json['num_times_rewatched'] as int,
    (json['mean_score'] as num)?.toDouble(),
  );
}
