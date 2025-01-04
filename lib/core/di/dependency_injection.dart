import 'package:dio/dio.dart';
import 'package:full_flutter_advanced_course/features/signup/data/repos/sign_up_repo.dart';
import 'package:full_flutter_advanced_course/features/signup/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../core/networking/api_service.dart';
import '../../core/networking/dio_factory.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
