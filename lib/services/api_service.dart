import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<bool> login(String username, String password) async {
    final url = Uri.parse('https://example.com/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
