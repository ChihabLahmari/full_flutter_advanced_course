import 'package:dio/dio.dart';
import 'package:full_flutter_advanced_course/core/networking/api_constants.dart';
import 'package:full_flutter_advanced_course/features/login/data/models/login_response.dart';
import 'package:full_flutter_advanced_course/features/signup/data/models/sign_up_request_body.dart';
import 'package:full_flutter_advanced_course/features/signup/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/models/login_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );
}
