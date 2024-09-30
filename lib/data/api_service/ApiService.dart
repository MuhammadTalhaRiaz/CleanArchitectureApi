import 'dart:convert';
import 'package:api_clean_structure/data/dto/ListDto.dart';
import 'package:api_clean_structure/data/dto/LoginDto.dart';
import 'package:api_clean_structure/data/requests/LoginRequestData.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl ="https://reqres.in/api";



  Future<LoginDto> login(LoginRequestData loginRequestData) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/login'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loginRequestData.toJson()),
    );

    print("Request body: ${json.encode(loginRequestData.toJson())}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("jsonData: $jsonData");
      return LoginDto.fromJson(jsonData); // Adjust according to your DTO
    } else {
      throw Exception("Failed to login, status code: ${response.statusCode}");
    }
  }
  Future<List<ListDto>> getList() async {
    final response = await http.get(Uri.parse('https://api.restful-api.dev/objects'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => ListDto.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
