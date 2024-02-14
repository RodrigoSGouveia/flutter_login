import 'package:flutter/material.dart';
import 'package:flutter_login/core/validations/email_validator.dart';
import 'package:flutter_login/core/validations/validations.dart';

class FormLogin extends StatelessWidget {
  final TextEditingController emailController;
  final Function(String) emailOnChanged;
  final String emailHint;
  final String emailErrorMessage;
  final TextEditingController passwordController;
  final Function(String) passwordOnChanged;
  final String passwordHint;
  final String passwordErrorMessage;
  final GlobalKey formKey;

  const FormLogin({
    super.key,
    required this.emailController,
    required this.emailOnChanged,
    required this.emailHint,
    required this.emailErrorMessage,
    required this.passwordController,
    required this.passwordErrorMessage,
    required this.passwordHint,
    required this.passwordOnChanged,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "E-mail",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          TextFormField(
            controller: emailController,
            validator: EmailValidator(errorText: emailErrorMessage),
            decoration: InputDecoration(
              hintText: emailHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onChanged: emailOnChanged,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Senha",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          TextFormField(
            controller: passwordController,
            validator: RequiredValidator(errorText: passwordErrorMessage),
            decoration: InputDecoration(
              hintText: passwordHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onChanged: passwordOnChanged,
          ),
        ],
      ),
    );
  }
}
