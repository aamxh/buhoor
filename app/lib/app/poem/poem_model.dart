import 'package:json_annotation/json_annotation.dart';

part 'poem_model.g.dart';

@JsonSerializable()
class Poem {

  final String title;
  final String content;
  final String poet;
  final String era;
  final String genre;
  final String meter;

  Poem({
    required this.title,
    required this.content,
    required this.poet,
    required this.genre,
    required this.era,
    required this.meter,
  });

  factory Poem.fromJson(Map<String, dynamic> json) => _$PoemFromJson(json);

  Map<String, dynamic> toJson() => _$PoemToJson(this);

}