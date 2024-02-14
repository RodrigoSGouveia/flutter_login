import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/core/di/injector.dart';
import 'package:flutter_login/core/keys/keys.dart';
import 'package:flutter_login/core/routes/routes_generator.dart';
import 'package:flutter_login/src/features/app/resources/app_strings_resources.dart';
import 'package:flutter_login/src/features/app/ui/cubit/cubit.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final AppCubit _cubit = getIt<AppCubit>();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(),
      child: BlocBuilder(
        bloc: _cubit,
        builder: (context, state) {
          if (state is AppLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AppFailureState) {
            return const Center(
              child: Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Um erro inesperado aconteceu,\npor favor tente novamente mais tarde"),
                  ],
                ),
              ),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStringsResources.title,
            scaffoldMessengerKey: scaffoldMessengerKey,
            navigatorKey: navigatorKey,
            onGenerateRoute: (settings) =>
                RoutesGenerator.generateRoutes(settings),
            builder: (context, child) => child!,
          );
        },
      ),
    );
  }
}
