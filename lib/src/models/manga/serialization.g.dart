// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serialization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Serialization _$SerializationFromJson(Map<String, dynamic> json) {
  return Serialization(
    json['node'] == null
        ? null
        : SerialNode.fromJson(json['node'] as Map<String, dynamic>),
  );
}
