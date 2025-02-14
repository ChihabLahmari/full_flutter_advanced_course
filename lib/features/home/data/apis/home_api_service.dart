import 'package:dio/dio.dart';
import 'package:full_flutter_advanced_course/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}
