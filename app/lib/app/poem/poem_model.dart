import 'package:json_annotation/json_annotation.dart';

part 'poem_model.g.dart';

@JsonSerializable()
class Poem {

  String title;
  String content;
  String poet;
  String era;
  String genre;
  String meter;

  Poem({
    this.title = '',
    this.content = '',
    this.poet = '',
    this.genre = '',
    this.era = '',
    this.meter = '',
  });

  factory Poem.fromJson(Map<String, dynamic> json) => _$PoemFromJson(json);

  Map<String, dynamic> toJson() => _$PoemToJson(this);

}