import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_flutter_advanced_course/core/di/dependency_injection.dart';
import 'package:full_flutter_advanced_course/core/helpers/constants.dart';
import 'package:full_flutter_advanced_course/core/helpers/extensions.dart';
import 'package:full_flutter_advanced_course/core/helpers/shared_prefrences.dart';
import 'package:full_flutter_advanced_course/core/routing/app_router.dart';
import 'package:full_flutter_advanced_course/doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  await getIfUserLoggedIn();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

getIfUserLoggedIn() async {
  String? token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!token.isNullOrEmpty()) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
}
