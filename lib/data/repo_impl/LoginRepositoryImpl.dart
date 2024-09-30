import 'package:api_clean_structure/data/Result.dart';
import 'package:api_clean_structure/data/api_service/ApiService.dart';
import 'package:api_clean_structure/data/requests/LoginRequestData.dart';
import 'package:api_clean_structure/domain/models/LoginModel.dart';
import 'package:api_clean_structure/domain/repository/LoginRepository.dart';


class LoginRepositoryImpl implements LoginRepository {
  final ApiService apiService;

  LoginRepositoryImpl(this.apiService);

  @override
  Future<Result<LoginModel>> login(LoginRequestData loginRequestData) async {
    try {
      final response = await apiService.login(loginRequestData);
      // Use toModel to convert DTO to domain model
      return Result.success(response.toModel());
    } catch (e) {
      return Result.failure('Login failed: ${e.toString()}');
    }
  }
}