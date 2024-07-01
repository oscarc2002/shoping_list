import 'package:shopping_list/features/list/domain/entities/grocery_item.dart';

class GroceryItemModel extends GroceryItem {
  GroceryItemModel({
    required super.id,
    required super.name,
    required super.quantity,
    required super.category,
  });

  factory GroceryItemModel.fromJson(Map<String, dynamic> map) {
    return GroceryItemModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? '',
      category: map['category'] ?? '',
    );
  }
}
