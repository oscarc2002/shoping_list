import 'package:get_it/get_it.dart';
import 'package:shopping_list/features/list/data/datasources/save_data_source.dart';
import 'package:shopping_list/features/list/data/repositories/save_repository_impl.dart';
import 'package:shopping_list/features/list/domain/repository/save_repository.dart';
import 'package:shopping_list/features/list/domain/usecases/user_save_item.dart';
import 'package:shopping_list/features/list/presentation/bloc/save_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initList();
}

void _initList() {
  serviceLocator.registerFactory<SaveDataSource>(
    () => SaveDataSourceImpl(),
  );

  serviceLocator.registerFactory<SaveRepository>(
    () => SaveRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSave(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(() => SaveBloc(userSave: serviceLocator()));
}
