import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_cubit.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_state.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/doctors_list/doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctors) {
            return setupSuccess(doctors);
          },
          doctorsError: (error) {
            return setupError(error);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccess(doctors) {
    return DoctorsListView(
      doctors: doctors ?? [],
    );
  }

  Widget setupError(error) {
    return const SizedBox.shrink();
  }
}
