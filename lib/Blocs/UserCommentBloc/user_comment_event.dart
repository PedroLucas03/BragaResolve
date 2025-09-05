part of 'user_comment_bloc.dart';

abstract class UserCommentsEvent {}

class LoadUserComments extends UserCommentsEvent {
  final int quantityOfComments;

  LoadUserComments(this.quantityOfComments);
}

class RefreshComments extends UserCommentsEvent {
  final int quantityOfComments;

  RefreshComments(this.quantityOfComments);
}
