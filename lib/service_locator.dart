import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:move_mate/core/base/base_cache.dart';
import 'package:move_mate/core/base/base_dio.dart';
import 'package:move_mate/core/network/network_info.dart';
import 'package:move_mate/features/houses_list/data/datasources/houses_service.dart';
import 'package:move_mate/features/houses_list/data/repositories/houses_repository_impl.dart';
import 'package:move_mate/features/houses_list/domain/repositories/houses_repository.dart';
import 'package:move_mate/features/houses_list/domain/usecases/houses_usecases.dart';
import 'package:move_mate/features/login/data/datasources/login_service.dart';
import 'package:move_mate/features/login/data/repositories/login_repository_impl.dart';
import 'package:move_mate/features/login/domain/repositories/login_repository.dart';
import 'package:move_mate/features/login/domain/usecases/login_use_case.dart';
import 'package:move_mate/features/register/data/data%20sources/register_service.dart';
import 'package:move_mate/features/register/data/repositories/register_repository_impl.dart';
import 'package:move_mate/features/register/domain/repositories/register_repository.dart';
import 'package:move_mate/features/register/domain/usecases/register_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class AppDependencies {
  Future<void> initialize() async {
    //external
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    sl.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());

    //core
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton<TheHttpExecuter>(() => TheHttpExecuter());
    sl.registerLazySingleton<LocalData>(() => LocalData(sl()));

    //data sources
    sl.registerLazySingleton<RegisterService>(() => RegisterServiceImpl(
        remoteData: sl(), localData: sl(), networkInfo: sl()));
    sl.registerLazySingleton<LoginService>(() =>
        LoginServiceImpl(remoteData: sl(), localData: sl(), networkInfo: sl()));
    sl.registerLazySingleton<HousesService>(() => HousesServiceImpl(
        remoteData: sl(), localData: sl(), networkInfo: sl()));
    //repositories
    sl.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl());
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
    sl.registerLazySingleton<HousesRepository>(() => HousesRepositoryImpl());

    //use cases
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase());
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
    sl.registerLazySingleton<RentedHousesUsecase>(() => RentedHousesUsecase());
  }
}
