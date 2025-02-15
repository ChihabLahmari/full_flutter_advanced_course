import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_cubit.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_state.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/specialization_list/speciality_list_view.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/specialization_list/speciality_shimmer_loading.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

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
          specializationSuccess: (specializationList) {
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
    return const Expanded(
      child: Column(
        children: [
          SpecialityShimmerLoading(),
          DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationList) {
    return SpecialityListView(
      specializationsDataList: specializationList ?? [],
    );
  }

  Widget setupError(error) {
    return const SizedBox.shrink();
  }
}
