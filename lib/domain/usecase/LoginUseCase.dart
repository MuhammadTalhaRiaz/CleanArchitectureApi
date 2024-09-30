import 'package:api_clean_structure/data/Result.dart';
import 'package:api_clean_structure/data/requests/LoginRequestData.dart';
import 'package:api_clean_structure/domain/repository/LoginRepository.dart';
import '../models/LoginModel.dart';
class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  // Updated method to return Result<LoginModel>
  Future<Result<LoginModel>> execute(LoginRequestData loginRequestData) async {
    // Call the repository and handle the result
    final result = await repository.login(loginRequestData);
    return result;  // Simply return the result (either success or failure)
  }
}
