import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_flutter_advanced_course/features/home/data/repos/home_repo.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecialization() async {
    emit(const HomeState.specializationLoading());

    final response = await _homeRepo.getSpecialization();

    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationSuccess(specializationsResponseModel));
      },
      failure: (errorHanlder) {
        emit(HomeState.specializationError(errorHanlder));
      },
    );
  }
}
