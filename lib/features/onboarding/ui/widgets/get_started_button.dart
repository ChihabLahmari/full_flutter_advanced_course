import 'package:flutter/material.dart';
import 'package:full_flutter_advanced_course/core/helpers/extensions.dart';
import 'package:full_flutter_advanced_course/core/routing/routes.dart';
import 'package:full_flutter_advanced_course/core/theming/colors.dart';
import 'package:full_flutter_advanced_course/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // remove the defualt space to full controll the button
        minimumSize: const WidgetStatePropertyAll(
          Size(double.infinity, 52),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
