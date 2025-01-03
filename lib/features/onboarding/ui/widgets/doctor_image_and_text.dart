import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_flutter_advanced_course/core/helpers/assets_helper.dart';
import 'package:full_flutter_advanced_course/core/theming/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.svgsDocdocLogoLowOpacity),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(Assets.imagesOnboardingDoctor),
        ),
        Positioned(
          bottom: 30.0,
          left: 0.0,
          right: 0.0,
          child: Text(
            "Best Doctor\nAppointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.4,
            ),
          ),
        )
      ],
    );
  }
}
