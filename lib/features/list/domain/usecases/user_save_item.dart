import 'package:fpdart/fpdart.dart';
import 'package:shopping_list/core/error/failures.dart';
import 'package:shopping_list/core/usecase/usecase.dart';
import 'package:shopping_list/features/list/domain/entities/grocery_item.dart';
import 'package:shopping_list/features/list/domain/repository/save_repository.dart';

class UserSave implements UseCase<GroceryItem, UserSaveParams> {
  final SaveRepository listRepository;
  const UserSave(this.listRepository);

  @override
  Future<Either<Failure, GroceryItem>> call(params) async {
    return listRepository.saveItem(
      name: params.name,
      quantity: params.quantity,
      category: params.category,
    );
  }
}

class UserSaveParams {
  final String name;
  final int quantity;
  final String category;

  UserSaveParams({
    required this.name,
    required this.quantity,
    required this.category,
  });
}
