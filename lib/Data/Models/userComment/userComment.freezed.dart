// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userComment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserComment {

 int get id; String get avatar; String get name; String get comment;
/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCommentCopyWith<UserComment> get copyWith => _$UserCommentCopyWithImpl<UserComment>(this as UserComment, _$identity);

  /// Serializes this UserComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserComment&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,name,comment);

@override
String toString() {
  return 'UserComment(id: $id, avatar: $avatar, name: $name, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $UserCommentCopyWith<$Res>  {
  factory $UserCommentCopyWith(UserComment value, $Res Function(UserComment) _then) = _$UserCommentCopyWithImpl;
@useResult
$Res call({
 int id, String avatar, String name, String comment
});




}
/// @nodoc
class _$UserCommentCopyWithImpl<$Res>
    implements $UserCommentCopyWith<$Res> {
  _$UserCommentCopyWithImpl(this._self, this._then);

  final UserComment _self;
  final $Res Function(UserComment) _then;

/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? avatar = null,Object? name = null,Object? comment = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserComment].
extension UserCommentPatterns on UserComment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserComment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserComment value)  $default,){
final _that = this;
switch (_that) {
case _UserComment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserComment value)?  $default,){
final _that = this;
switch (_that) {
case _UserComment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String avatar,  String name,  String comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserComment() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.comment);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String avatar,  String name,  String comment)  $default,) {final _that = this;
switch (_that) {
case _UserComment():
return $default(_that.id,_that.avatar,_that.name,_that.comment);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String avatar,  String name,  String comment)?  $default,) {final _that = this;
switch (_that) {
case _UserComment() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserComment implements UserComment {
  const _UserComment({required this.id, required this.avatar, required this.name, required this.comment});
  factory _UserComment.fromJson(Map<String, dynamic> json) => _$UserCommentFromJson(json);

@override final  int id;
@override final  String avatar;
@override final  String name;
@override final  String comment;

/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCommentCopyWith<_UserComment> get copyWith => __$UserCommentCopyWithImpl<_UserComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserComment&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,name,comment);

@override
String toString() {
  return 'UserComment(id: $id, avatar: $avatar, name: $name, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$UserCommentCopyWith<$Res> implements $UserCommentCopyWith<$Res> {
  factory _$UserCommentCopyWith(_UserComment value, $Res Function(_UserComment) _then) = __$UserCommentCopyWithImpl;
@override @useResult
$Res call({
 int id, String avatar, String name, String comment
});




}
/// @nodoc
class __$UserCommentCopyWithImpl<$Res>
    implements _$UserCommentCopyWith<$Res> {
  __$UserCommentCopyWithImpl(this._self, this._then);

  final _UserComment _self;
  final $Res Function(_UserComment) _then;

/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? avatar = null,Object? name = null,Object? comment = null,}) {
  return _then(_UserComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
