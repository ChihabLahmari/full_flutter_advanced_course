import 'package:full_flutter_advanced_course/core/networking/api_error_handler.dart';
import 'package:full_flutter_advanced_course/core/networking/api_result.dart';
import 'package:full_flutter_advanced_course/core/networking/api_service.dart';
import 'package:full_flutter_advanced_course/features/signup/data/models/sign_up_request_body.dart';
import 'package:full_flutter_advanced_course/features/signup/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
