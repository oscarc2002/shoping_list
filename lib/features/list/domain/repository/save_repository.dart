import 'package:fpdart/fpdart.dart';
import 'package:shopping_list/core/error/failures.dart';

abstract interface class SaveRepository {
  Future<Either<Failure, String>> saveItem({
    required var name,
    required var quantity,
    required var category,
  });
}
