
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/core/dio_service/dio_provider.dart';
import 'package:quiz/core/dio_service/dio_service.dart';
import 'package:quiz/core/dio_service/dio_service_impl.dart';
import 'package:quiz/core/manager/bloc_observer.dart';
import 'package:quiz/core/manager/global_cubit/global_cubit.dart';
import 'package:quiz/core/network_service/network_provider.dart';
import 'package:quiz/core/network_service/network_service.dart';
import 'package:quiz/core/network_service/network_service_impl.dart';
import 'package:quiz/core/repository/global/global_repository.dart';
import 'package:quiz/core/repository/global/global_repository_impl.dart';
import 'package:quiz/core/shared_preferences/preference_helper.dart';
import 'package:quiz/core/shared_preferences/preferences_provider.dart';
import 'package:quiz/feature/auth/data_source/remote/auth_data_source.dart';
import 'package:quiz/feature/auth/data_source/remote/auth_data_source_impl.dart';
import 'package:quiz/feature/auth/data_source/repository/auth_repository.dart';
import 'package:quiz/feature/auth/data_source/repository/auth_repository_impl.dart';
import 'package:quiz/feature/auth/manager/auth_cubit.dart';


final serviceLocator = GetIt.instance;

Future initApp() async {
  Bloc.observer = MyBlocObserver();

  /// ui cubit
  serviceLocator.registerFactory(
    () => GlobalCubit(
      globalRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => AuthCubit(authRepository: serviceLocator()),
  );


  /// repositories
  serviceLocator.registerLazySingleton<GlobalRepository>(
    () => GlobalRepositoryImpl(
      helper: serviceLocator(),
    ),
  );


  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkService: serviceLocator(),
      authDataSource: serviceLocator(),
    ),
  );



  /// others


  serviceLocator.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      dioService: serviceLocator(),
    ),
  );


  /// services
  serviceLocator.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelper(
      preferencesProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DioService>(
    () => DioServiceImpl(
      dioProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(
      networkProvider: serviceLocator(),
    ),
  );

  /// providers
  serviceLocator.registerLazySingleton(
    () => SharedPreferencesProvider.instance,
  );
  serviceLocator.registerLazySingleton<DioProvider>(
    () => DioProvider.instance,
  );
  serviceLocator.registerLazySingleton<NetworkProvider>(
    () => NetworkProvider.instance,
  );
}
