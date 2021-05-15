// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericResponse _$GenericResponseFromJson(Map<String, dynamic> json) {
  return GenericResponse(
    (json['data'] as List?)
        ?.map((e) => NodeContainer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
