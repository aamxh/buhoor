import 'package:json_annotation/json_annotation.dart';

part 'poet_model.g.dart';

@JsonSerializable()
class Poet {

  String name;
  String bio;
  String era;

  Poet({
    this.name = '',
    this.bio = '',
    this.era = '',
  });

  factory Poet.fromJson(Map<String, dynamic> json) => _$PoetFromJson(json);

  Map<String, dynamic> toJson() => _$PoetToJson(this);

}