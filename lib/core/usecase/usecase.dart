import 'package:shopping_list/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SucessType, Params>{
  Future<Either<Failure, SucessType>> call(Params params);
}