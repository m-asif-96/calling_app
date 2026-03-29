import 'package:get_it/get_it.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/domain/usecases/register_usecase.dart';
import '../features/auth/domain/repository/auth_repository.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/data/datasource/auth_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc
  sl.registerFactory(() => AuthBloc(registerUseCase: sl(), loginUseCase: sl()));

  /// UseCases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));

  /// Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  /// DataSources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
}
