import 'package:auth_app/core/network/dio_client.dart';
import 'package:auth_app/data/repository/auth.dart';
import 'package:auth_app/data/source/auth_api_service.dart';
import 'package:auth_app/data/source/auth_local_service.dart';
import 'package:auth_app/domain/repository/auth.dart';
import 'package:auth_app/domain/usecases/get_user.dart';
import 'package:auth_app/domain/usecases/is_logged_in.dart';
import 'package:auth_app/domain/usecases/logout.dart';
import 'package:auth_app/domain/usecases/signin.dart';
import 'package:auth_app/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
