import 'package:flutter/material.dart';
import 'package:flutter_login/core/di/injector.dart';
import 'package:flutter_login/src/features/app/ui/app_page.dart';

void main() {
  configureDependencies();
  runApp(const AppPage());
}
