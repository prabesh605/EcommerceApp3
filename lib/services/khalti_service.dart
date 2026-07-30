import 'dart:convert';

import 'package:http/http.dart' as http;

class KhaltiService {
  Future<Map<String, dynamic>> getKhaltiPidxNumber() async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:3000/pay'),
      );
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
