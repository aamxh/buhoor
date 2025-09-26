// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poet _$PoetFromJson(Map<String, dynamic> json) => Poet(
      name: json['name'] as String,
      bio: json['bio'] as String,
      eraId: (json['era_id'] as num).toInt(),
    );

Map<String, dynamic> _$PoetToJson(Poet instance) => <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'era_id': instance.eraId,
    };
