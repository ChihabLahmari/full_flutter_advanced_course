import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_flutter_advanced_course/core/helpers/spacing.dart';
import 'package:full_flutter_advanced_course/core/theming/styles.dart';
import 'package:full_flutter_advanced_course/features/home/data/models/specializations_response_model.dart';

class DoctorListViewItem extends StatelessWidget {
  final Doctor? doctor;
  const DoctorListViewItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 110.w,
              height: 120.h,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "https://i.pinimg.com/736x/50/08/ef/5008efb9df96969624d2674645027a3a.jpg",
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor?.name ?? 'Dr. Chihab',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  // 'Degree | 013241512351',
                  "${doctor?.degree ?? 'Degree'} | ${doctor?.phone ?? '013241512351'}",
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text(
                  doctor?.email ?? 'doctor@example.com',
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
