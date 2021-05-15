// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return Statistics(
    json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    json['num_list_users'] as int?,
  );
}
