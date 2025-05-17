import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<Map<String, dynamic>> predict(
    Map<String, dynamic> inputData,
  ) async {
    final url = Uri.parse('http://127.0.0.1:5000/predict');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(inputData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception(
          'Failed to get prediction. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error during prediction: $e');
    }
  }
}
