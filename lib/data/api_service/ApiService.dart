import 'dart:convert';
import 'dart:io';
import 'package:api_clean_structure/data/dto/ListDto.dart';
import 'package:api_clean_structure/data/dto/LoginDto.dart';
import 'package:api_clean_structure/data/requests/LoginRequestData.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://reqres.in/api";


  Future<LoginDto> login(LoginRequestData loginRequestData) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(loginRequestData.toJson()),
      );

      print("Request body: ${json.encode(loginRequestData.toJson())}");
      print("Response status: ${response.statusCode}");

      // Check for status code 200 (success)
      if (response.statusCode == 200) {
        try {
          final jsonData = json.decode(response.body);
          print("jsonData: $jsonData");
          return LoginDto.fromJson(jsonData);
        } catch (e) {
          // Handle JSON parsing error
          throw Exception("Failed to parse login response: ${e.toString()}");
        }
      } else {
        // Handle non-200 responses as an error
        throw Exception("Failed to login, status code: ${response
            .statusCode}, message: ${response.body}");
      }
    } catch (e) {
      // Handle other errors (network, unexpected)
      print("Login error: ${e.toString()}");
      throw Exception("An error occurred during login: ${e.toString()}");
    }
  }

  Future<List<ListDto>> getList() async {
    try {
      final response = await http.get(
          Uri.parse('https://api.restful-api.dev/objects'));

      // Check if the response status is 200 (OK)
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => ListDto.fromJson(item)).toList();
      } else {
        // Handle different status codes
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on SocketException {
      // Handle network issues (no internet, DNS errors, etc.)
      throw Exception('No Internet connection. Please try again later.');
    } on FormatException {
      // Handle JSON parsing errors
      throw Exception('Invalid response format. Please try again later.');
    } catch (e) {
      // Catch-all for any other exceptions
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }
}