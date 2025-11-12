import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity?> call(String email, String password, String name) {
    return repository.signUp(email, password, name: name);
  }
}
