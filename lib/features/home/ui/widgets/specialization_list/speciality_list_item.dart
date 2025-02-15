import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_flutter_advanced_course/core/helpers/spacing.dart';
import 'package:full_flutter_advanced_course/core/theming/colors.dart';
import 'package:full_flutter_advanced_course/core/theming/styles.dart';
import 'package:full_flutter_advanced_course/features/home/data/models/specializations_response_model.dart';

class SpecialityListItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int index;
  final bool isSelected;
  // final String specialityImageUrl;
  const SpecialityListItem(
      {super.key, required this.specializationsData, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
      child: Column(
        children: [
          isSelected
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    child: Image.asset(
                      // specialityImageUrl,
                      "assets/images/speciality_doctor.png",
                      width: 52.w,
                      height: 52.h,
                    ),
                  ),
                )
              : CircleAvatar(
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
            style: isSelected ? TextStyles.font14DarkBlueBold : TextStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
