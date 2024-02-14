import 'package:flutter/material.dart';

import 'package:flutter_login/core/validations/validations.dart';
import 'package:flutter_login/src/features/login/resources/resources.dart';

class FormLogin extends StatefulWidget {
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
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool pObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              LoginStringsResources.email,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45),
            child: TextFormField(
              controller: widget.emailController,
              validator: EmailValidator(errorText: widget.emailErrorMessage),
              decoration: InputDecoration(
                hintText: widget.emailHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: widget.emailOnChanged,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              LoginStringsResources.password,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.passwordController,
                  obscureText: pObscured,
                  validator:
                      RequiredValidator(errorText: widget.passwordErrorMessage),
                  decoration: InputDecoration(
                    hintText: widget.passwordHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: widget.passwordOnChanged,
                ),
              ),
              IconButton(
                onPressed: () => setState(() {
                  pObscured = !pObscured;
                }),
                icon: Icon(pObscured
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
