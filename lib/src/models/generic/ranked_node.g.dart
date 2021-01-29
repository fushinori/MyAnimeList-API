// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranked_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankedNode _$RankedNodeFromJson(Map<String, dynamic> json) {
  return RankedNode(
    json['node'] == null
        ? null
        : Node.fromJson(json['node'] as Map<String, dynamic>),
    json['ranking'] == null
        ? null
        : Ranking.fromJson(json['ranking'] as Map<String, dynamic>),
  );
}
