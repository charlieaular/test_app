import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/features/data/datasources/auth_local_datasource.dart';
import 'package:test_app/features/data/repositories/auth_repository_impl.dart';
import 'package:test_app/features/data/repositories/places_repository_impl.dart';
import 'package:test_app/features/domain/repositories/auth_repository.dart';
import 'package:test_app/features/domain/repositories/places_repository.dart';
import 'package:test_app/features/domain/usecases/login_usecase.dart';

import 'features/data/datasources/places_remote_datasource.dart';
import 'features/domain/usecases/clear_all_usecase.dart';
import 'features/domain/usecases/get_restaurants_usecase.dart';
import 'features/domain/usecases/get_token_usecase.dart';
import 'features/domain/usecases/register_usecase.dart';
import 'features/presentation/controllers/home_controller.dart';
import 'features/presentation/controllers/login_controller.dart';
import 'features/presentation/controllers/register_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
      () => LoginController(loginUseCase: sl(), getTokenUseCase: sl()));
  sl.registerFactory(() => RegisterController(registerUseCase: sl()));
  sl.registerFactory(() => HomeController(getRestaurantsUseCase: sl()));

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetTokenUseCase(sl()));
  sl.registerLazySingleton(() => ClearAllUseCase(sl()));
  sl.registerLazySingleton(() => GetRestaurantsUseCase(sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authLocalDatasource: sl()));
  sl.registerLazySingleton<PlacesRepository>(
      () => PlacesRepositoryImpl(placesRemoteDataSource: sl()));

  //
  sl.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<PlacesRemoteDataSource>(
      () => PlacesRemoteDataSourceImpl());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
