import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_flutter_advanced_course/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi ,Chihab!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How are you today?',
              style: TextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset('assets/svgs/notif.svg'),
        )
      ],
    );
  }
}
