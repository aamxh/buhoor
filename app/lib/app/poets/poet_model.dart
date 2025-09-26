import 'package:json_annotation/json_annotation.dart';

part 'poet_model.g.dart';

@JsonSerializable()
class Poet {

  final String name;
  final String bio;
  final int eraId;

  Poet({
    required this.name,
    required this.bio,
    required this.eraId,
  });

  factory Poet.fromJson(Map<String, dynamic> json) => _$PoetFromJson(json);

  Map<String, dynamic> toJson() => _$PoetToJson(this);

}