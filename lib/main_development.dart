import 'package:flutter/material.dart';
import 'package:full_flutter_advanced_course/core/di/dependency_injection.dart';
import 'package:full_flutter_advanced_course/core/routing/app_router.dart';
import 'package:full_flutter_advanced_course/doc_app.dart';

void main() {
  setUpGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
