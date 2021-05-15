// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return Recommendation(
    json['node'] == null
        ? null
        : Node.fromJson(json['node'] as Map<String, dynamic>),
    json['num_recommendations'] as int?,
  );
}
