import 'package:braga_resolve/Domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signUp(String email, String password, {String? name});
}
