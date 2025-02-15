import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_flutter_advanced_course/core/helpers/extensions.dart';
import 'package:full_flutter_advanced_course/core/networking/api_error_handler.dart';
import 'package:full_flutter_advanced_course/features/home/data/models/specializations_response_model.dart';
import 'package:full_flutter_advanced_course/features/home/data/repos/home_repo.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationDataList = [];
  void getSpecialization() async {
    emit(const HomeState.specializationLoading());

    final response = await _homeRepo.getSpecialization();

    response.when(
      success: (specializationsResponseModel) {
        specializationDataList = specializationsResponseModel.specializationDataList ?? [];
        getDoctorsList(specializationId: specializationDataList?.first?.id);
        emit(HomeState.specializationSuccess(specializationDataList));
      },
      failure: (errorHanlder) {
        emit(HomeState.specializationError(errorHanlder));
      },
    );
  }


  void getDoctorsList({required int? specializationId}) async {
    List<Doctor?>? doctorsList = getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(DoctorsSuccess(doctorsList));
    } else {
      emit(DoctorsError(ErrorHandler.handle('No doctors found')));
    }
  }

  getDoctorsListBySpecializationId(specializationId) {
    return specializationDataList?.firstWhere((specialization) => specialization?.id == specializationId)?.doctorsList;
  }
}
