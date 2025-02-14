import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_flutter_advanced_course/core/helpers/spacing.dart';
import 'package:full_flutter_advanced_course/core/theming/colors.dart';
import 'package:full_flutter_advanced_course/core/theming/styles.dart';
import 'package:full_flutter_advanced_course/features/home/data/models/specializations_response_model.dart';

class DoctorSpecialityListItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int index;
  // final String specialityImageUrl;
  const DoctorSpecialityListItem({
    super.key,
    required this.specializationsData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManager.lightBlue,
            child: Image.asset(
              // specialityImageUrl,
              "assets/images/speciality_doctor.png",
              width: 50.w,
              height: 50.h,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? 'Speciality',
            style: TextStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
