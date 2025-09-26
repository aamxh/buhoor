// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poem _$PoemFromJson(Map<String, dynamic> json) => Poem(
      title: json['title'] as String,
      content: json['content'] as String,
      poet: json['poet'] as String,
      genre: json['genre'] as String,
      era: json['era'] as String,
      meter: json['meter'] as String,
    );

Map<String, dynamic> _$PoemToJson(Poem instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'poet': instance.poet,
      'era': instance.era,
      'genre': instance.genre,
      'meter': instance.meter,
    };
