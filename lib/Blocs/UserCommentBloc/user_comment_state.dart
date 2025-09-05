part of 'user_comment_bloc.dart';

abstract class UserCommentsState {}

class UserCommentInitial extends UserCommentsState {}

class UserCommentsLoading extends UserCommentsState {}

class UserCommentsLoaded extends UserCommentsState {
  final List<UserComment> comments;

  UserCommentsLoaded(this.comments);
}

class UserCommentsError extends UserCommentsState {
  final String message;

  UserCommentsError(this.message);
}
