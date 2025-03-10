import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  Future<Map<String, dynamic>> fetchUserData(int userId) async {
    print('fetchUserData called with userId: $userId');
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
