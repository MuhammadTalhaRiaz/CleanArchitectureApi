import 'package:api_clean_structure/data/requests/LoginRequestData.dart';
import 'package:api_clean_structure/domain/models/LoginModel.dart';

import '../../data/Result.dart';

abstract class LoginRepository {
  Future<Result<LoginModel>> login(LoginRequestData loginRequestData);
}
