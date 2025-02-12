import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_flutter_advanced_course/core/helpers/spacing.dart';
import 'package:full_flutter_advanced_course/core/theming/colors.dart';
import 'package:full_flutter_advanced_course/core/theming/styles.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    // child: SvgPicture.asset(
                    //   'assets/svgs/speciality_3.svg',
                    //   width: 40.w,
                    //   height: 40.h,
                    // ),
                    child: Image.asset(
                      'assets/images/speciality_doctor.png',
                      width: 50.w,
                      height: 50.h,
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    'Specialization',
                    style: TextStyles.font12DarkBlueRegular,
                  )
                ],
              ),
            );
          }),
    );
  }
}
