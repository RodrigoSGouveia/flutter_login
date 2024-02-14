import 'package:flutter_login/core/validations/validations.dart';

class EmailValidator extends TextFieldValidator {
  // A shout out to Ivan in the following link about the regex:
  // https://groups.google.com/g/dotnet_br/c/O-6-UEzPF-4?pli=1

  final Pattern _emailPattern =
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$";

  EmailValidator({
    required String errorText,
    bool? validatedIf,
  }) : super(errorText, validatedIf);

  @override
  bool isValid(String? value) =>
      hasMatch(_emailPattern.toString().trim(), value!, caseSensitive: false);
}
