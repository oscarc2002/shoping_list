import 'package:fpdart/fpdart.dart';
import 'package:shopping_list/core/error/exceptions.dart';
import 'package:shopping_list/core/error/failures.dart';
import 'package:shopping_list/features/list/data/datasources/save_data_source.dart';
import 'package:shopping_list/features/list/domain/repository/save_repository.dart';
class SaveRepositoryImpl implements SaveRepository {
  final SaveDataSource remoteDataSource;
  const SaveRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> saveItem({
    required var name,
    required var quantity,
    required var category,
  }) async {
    try {
      final response = await remoteDataSource.saveItem(
        name: name,
        quantity: quantity,
        category: category,
      );

      return right(response);
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }
}
