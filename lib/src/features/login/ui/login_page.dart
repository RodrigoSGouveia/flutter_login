import 'package:flutter/material.dart';
import 'package:flutter_login/core/di/injector.dart';
import 'package:flutter_login/src/features/login/resources/resources.dart';
import 'package:flutter_login/src/features/login/ui/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/src/features/login/ui/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginCubit _cubit = getIt<LoginCubit>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  String name = "";

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
    return Scaffold(
        body: BlocConsumer(
      bloc: _cubit,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          setState(() {});
        }

        if (state is LoginLoadingState) {}
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const LoadingStatebody();
        }

        if (state is LoginFailureState) {
          return const ErrorStateFailure();
        }

        return _body();
      },
    ));
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("assets/indt.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            LoginStringsResources.indt,
            style: TextStyle(
                fontSize: 30,
                color: Colors.grey[600],
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              name == ""
                  ? LoginStringsResources.welcome.replaceAll(
                      LoginStringsResources.token,
                      LoginStringsResources.unknown)
                  : LoginStringsResources.welcome.replaceAll(
                      LoginStringsResources.token, email.text.split("@")[0]),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.w700,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Text(
            LoginStringsResources.welcome2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              fontWeight: FontWeight.w700,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 50,
            ),
            child: FormLogin(
              formKey: formKey,
              emailController: email,
              emailErrorMessage: LoginStringsResources.emailError,
              emailHint: LoginStringsResources.email,
              emailOnChanged: (p0) => setState(() {
                name = p0;
              }),
              passwordController: password,
              passwordErrorMessage: LoginStringsResources.passwordError,
              passwordHint: LoginStringsResources.password,
              passwordOnChanged: (p0) {},
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: onLogin,
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Text(
                    LoginStringsResources.enter,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Text(
                    LoginStringsResources.signin,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onLogin() {
    final validated = formKey.currentState!.validate();

    if (!validated) return;

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text(LoginStringsResources.loginSuccessfull),
      duration: Duration(seconds: 1),
    ));
  }
}
