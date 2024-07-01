import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_list/features/list/data/models/grocery_item_model.dart';

abstract interface class SaveDataSource {
  Future<GroceryItemModel> saveItem({
    required var name,
    required var quantity,
    required var category,
  });
}

class SaveDataSourceImpl implements SaveDataSource {
  @override
  Future<GroceryItemModel> saveItem({
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
