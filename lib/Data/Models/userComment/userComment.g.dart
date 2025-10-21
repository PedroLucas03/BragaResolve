// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userComment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserComment _$UserCommentFromJson(Map<String, dynamic> json) => _UserComment(
  id: (json['id'] as num).toInt(),
  avatar: json['avatar'] as String,
  name: json['name'] as String,
  comment: json['comment'] as String,
);

Map<String, dynamic> _$UserCommentToJson(_UserComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'comment': instance.comment,
    };
