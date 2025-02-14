import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_flutter_advanced_course/core/helpers/spacing.dart';
import 'package:full_flutter_advanced_course/core/theming/colors.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_cubit.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_state.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/doctors_list_view.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/doctors_speciality_list_view.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading || current is SpecializationSuccess || current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setupLoading();
          },
          specializationSuccess: (specializationsResponseModel) {
            var specializationList = specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationList);
          },
          specializationError: (error) {
            return setupError(error);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(
          color: ColorsManager.mainBlue,
        ),
      ),
    );
  }

  Widget setupSuccess(specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationsDataList: specializationList ?? [],
          ),
          verticalSpace(8),
          DoctorsListView(
            doctors: specializationList?[0]?.doctorsList ?? [],
          ),
        ],
      ),
    );
  }

  Widget setupError(error) {
    return const SizedBox.shrink();
  }
}
