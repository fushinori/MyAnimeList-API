// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranked_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankedResponse _$RankedResponseFromJson(Map<String, dynamic> json) {
  return RankedResponse(
    (json['data'] as List?)
        ?.map((e) => RankedNode.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
