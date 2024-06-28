import 'dart:convert';

import 'package:http/http.dart' as http;

abstract interface class SaveDataSource {
  Future<String> saveItem({
    required var name,
    required var quantity,
    required var category,
  });
}

class SaveDataSourceImpl implements SaveDataSource {
  @override
  Future<String> saveItem({
    required var name,
    required var quantity,
    required var category,
  }) async {
    try {
      final url = Uri.https(
          'flutter-shop-942c5-default-rtdb.firebaseio.com', 'shop-list.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'name': name,
            'quantity': quantity,
            'category': category,
          },
        ),
      );
      final Map<String, dynamic> resData = json.decode(response.body);

      return resData['name'];
    } catch (error) {
      throw error.toString();
    }
  }
}
