import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/register/bloc/register_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/datasource/auth_datasource.dart';
import 'package:capacity_club_mobile_app/auth/data/repository/auth_repository_impl.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/bloc/home_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/datasource/indoor_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/repository/indoor_training_repository_impl.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  serviceLocator.registerFactory<AuthFlowBloc>(
      () => AuthFlowBloc(authUseCase: serviceLocator()));
  serviceLocator.registerFactory<LoginBloc>(
      () => LoginBloc(authUseCase: serviceLocator()));
  serviceLocator.registerFactory<RegisterBloc>(
      () => RegisterBloc(authUseCase: serviceLocator()));
  serviceLocator.registerFactory<HomePageBloc>(() => HomePageBloc());
// ! domain Layer
  serviceLocator.registerFactory<AuthUseCase>(
      () => AuthUseCase(authRepository: serviceLocator()));
// ! data Layer
  serviceLocator.registerFactory<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(authDataSource: serviceLocator()));
  serviceLocator.registerFactory<AuthDataSource>(
      () => AuthDataSource(dioClient: serviceLocator()));

  serviceLocator.registerFactory<IndoorTrainingRepositoryImpl>(() =>
      IndoorTrainingRepositoryImpl(indoorTrainingDataSource: serviceLocator()));
  serviceLocator.registerFactory<IndoorTrainingDataSource>(
      () => IndoorTrainingDataSource(dioClient: serviceLocator()));
// ! externs
  serviceLocator.registerFactory(() => DioClient());
}
/*

Future<void> init() async {
// ! externs
  serviceLocator.registerLazySingleton(() => DioClient());

  // ! data Layer
  serviceLocator
      .registerLazySingleton(() => AuthDataSource(dioClient: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => AuthRepositoryImpl(authDataSource: serviceLocator()));

  // ! domain Layer
  serviceLocator.registerLazySingleton(
      () => AuthUseCase(authRepository: serviceLocator()));

  // ! application Layer
  serviceLocator.registerLazySingleton(() => AuthFlowBloc());
  serviceLocator.registerLazySingleton(() => LoginBloc(
      authUseCase:
          serviceLocator())); // Assurez-vous que AuthUseCase est déjà enregistré
}
*/