import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Photo extends Equatable {
  int id;
  String tags;
  String previewUrl;

  Photo({
    required this.id,
    required this.tags,
    required this.previewUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => photoFromJson(json);
  Map<String, dynamic> toJson() => photoToJson(this);

  @override
  List<Object?> get props => [id];
}

Photo photoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'] as int,
      tags: json['tags'] as String,
      previewUrl: json['previewUrl'] as String,
    );

Map<String, dynamic> photoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'tags': instance.tags,
      'previewUrl': instance.previewUrl,
    };
