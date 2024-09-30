import 'package:api_clean_structure/domain/models/LoginModel.dart';

class LoginDto {
  final String token;


  LoginDto({
    required this.token,

  });

  // Add the toModel method
  LoginModel toModel() {
    return LoginModel(
      token: token,

    );
  }

  // Optionally, you could add a fromJson method to parse the DTO from a JSON response
  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(

      token: json['token'],

    );
  }
}
