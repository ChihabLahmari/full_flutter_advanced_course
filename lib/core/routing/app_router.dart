import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_flutter_advanced_course/core/di/dependency_injection.dart';
import 'package:full_flutter_advanced_course/core/routing/routes.dart';
import 'package:full_flutter_advanced_course/features/home/ui/home_screen.dart';
import 'package:full_flutter_advanced_course/features/login/logic/cubit/login_cubit.dart';
import 'package:full_flutter_advanced_course/features/login/ui/login_screen.dart';
import 'package:full_flutter_advanced_course/features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this argument to be passed in any screen like this ( arguments as ClassName)
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
