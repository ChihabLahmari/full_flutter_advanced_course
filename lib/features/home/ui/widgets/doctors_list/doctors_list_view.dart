import 'package:flutter/material.dart';
import 'package:full_flutter_advanced_course/features/home/data/models/specializations_response_model.dart';
import 'package:full_flutter_advanced_course/features/home/ui/widgets/doctors_list/doctor_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctor?> doctors;
  const DoctorsListView({
    super.key,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorListViewItem(doctor: doctor);
        },
      ),
    );
  }
}
