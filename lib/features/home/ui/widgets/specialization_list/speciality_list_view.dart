import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_flutter_advanced_course/features/home/data/models/specializations_response_model.dart';
import 'package:full_flutter_advanced_course/features/home/logic/home_cubit.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/specialization_list/speciality_list_item.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsDataList;
  const SpecialityListView({super.key, required this.specializationsDataList});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  int selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(specializationId: widget.specializationsDataList[index]?.id);
            },
            child: SpecialityListItem(
              index: index,
              specializationsData: widget.specializationsDataList[index],
              isSelected: selectedSpecializationIndex == index,
            ),
          );
        },
      ),
    );
  }
}
