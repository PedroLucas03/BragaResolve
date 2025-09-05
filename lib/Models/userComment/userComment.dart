import 'package:freezed_annotation/freezed_annotation.dart';

part 'userComment.freezed.dart';
part 'userComment.g.dart';

@freezed
abstract class UserComment with _$UserComment {
  const factory UserComment({
    required int id,
    required String avatar,
    required String name,
    required String comment,
  }) = _UserComment;

  factory UserComment.fromJson(Map<String, dynamic> json) =>
      _$UserCommentFromJson(json);
}
