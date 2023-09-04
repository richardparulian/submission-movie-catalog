import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class HeaderManager {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _tokenKey = 'accessToken';

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  static Future<Map<String, String>> getHeaders() async {
    String? token = await _secureStorage.read(key: _tokenKey); 

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  static Future<http.Response> get(String url) async {
    final headers = await getHeaders();
    final response = await http.get(Uri.parse(url), headers: headers);

    return response;
  }

  static Future<http.Response> post(String url, dynamic body) async {
    final headers = await getHeaders();
    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    return response;
  }

  static Future<http.Response> postWithParam(String url) async {
    final headers = await getHeaders();
    final response = await http.post(Uri.parse(url), headers: headers);

    return response;
  }

  // Add other reusable HTTP methods as needed (e.g., put, delete, etc.)
}
