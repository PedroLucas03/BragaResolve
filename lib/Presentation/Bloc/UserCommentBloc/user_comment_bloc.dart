import 'package:braga_resolve/Data/Models/userComment/userComment.dart';
import 'package:braga_resolve/Data/user_comment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_comment_event.dart';
part 'user_comment_state.dart';

class UserCommentsBloc extends Bloc<UserCommentsEvent, UserCommentsState> {
  final UserCommentsRepository repository;

  UserCommentsBloc(this.repository) : super(UserCommentInitial()) {
    on<LoadUserComments>((event, emit) async {
      emit(UserCommentsLoading());
      await Future.delayed(const Duration(seconds: 4));
      try {
        final comments = await repository.loadComments(
          event.quantityOfComments,
        );
        emit(UserCommentsLoaded(comments));
      } catch (e) {
        emit(UserCommentsError("Não foi possível carregar os comentários!"));
      }
    });

    on<RefreshComments>((event, emit) async {
      add(LoadUserComments(event.quantityOfComments));
    });
  }
}
