import 'package:fpdart/fpdart.dart';
import 'package:shopping_list/core/error/failures.dart';
import 'package:shopping_list/features/list/domain/entities/grocery_item.dart';

abstract interface class SaveRepository {
  Future<Either<Failure, GroceryItem>> saveItem({
    required var name,
    required var quantity,
    required var category,
  });
}
