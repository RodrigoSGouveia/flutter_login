import 'package:flutter/material.dart';
import 'package:flutter_login/src/features/login/resources/resources.dart';

class ErrorStateFailure extends StatelessWidget {
  const ErrorStateFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
          SizedBox(
            height: 20,
          ),
          Text(LoginStringsResources.error),
        ],
      ),
    );
  }
}
