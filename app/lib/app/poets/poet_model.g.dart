// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poet _$PoetFromJson(Map<String, dynamic> json) => Poet(
      name: json['name'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      era: json['era'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$PoetToJson(Poet instance) => <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'era': instance.era,
      'slug': instance.slug,
    };
