import 'package:flutter_pair_programming_lab/action/data/datasources/local/action_local_datasource.dart';
import 'package:flutter_pair_programming_lab/action/data/repositories/action_repository_impl.dart';
import 'package:flutter_pair_programming_lab/action/domain/repositories/action_repository_interface.dart';
import 'package:flutter_pair_programming_lab/action/domain/usecases/get_action_list_usecase.dart';
import 'package:flutter_pair_programming_lab/action/domain/usecases/update_status_usecase.dart';
import 'package:flutter_pair_programming_lab/action/presentation/cubit/action_cubit.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void setUpDependencyInjection() {
  // DataSource
  injector.registerLazySingleton<ActionLocalDatasourceInterface>(
    () => ActionLocalDatasourceImpl(),
  );

  // Repositories
  injector.registerLazySingleton<ActionRepositoryInterface>(
    () => ActionRepositoryImpl(
      localDatasource: injector<ActionLocalDatasourceInterface>(),
    ),
  );

  // UseCases
  injector.registerLazySingleton(
    () => GetActionListUsecase(
      repository: injector<ActionRepositoryInterface>(),
    ),
  );
  injector.registerLazySingleton(
    () => UpdateStatusUsecase(
      repository: injector<ActionRepositoryInterface>(),
    ),
  );

  // Cubit
  injector.registerFactory(
    () => ActionCubit(
      getActionListUsecase: injector<GetActionListUsecase>(),
      updateStatusUsecase: injector<UpdateStatusUsecase>(),
    ),
  );
}
