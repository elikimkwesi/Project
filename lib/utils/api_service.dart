import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://backend-sw02.onrender.com';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> signup(String email, String phone, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'phone': phone, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to send reset password email');
    }
  }

  Future<Map<String, dynamic>> verifyOTP(String userId, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/verifyOTP'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'otp': otp}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to verify OTP');
    }
  }
}
