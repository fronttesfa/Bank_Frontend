import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_end/provider/auth/authentication_provider.dart';
import 'package:front_end/provider/auth/login_form_provider.dart';

import 'package:front_end/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../widgets/custom_text_field.dart';

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class Login extends HookConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useTextEditingController();
    final password = useTextEditingController();

    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          authenticated: (user) {
            // Navigate to dashboard screen
            context.go("/dashboard");
            Fluttertoast.showToast(
                msg: "User Logged In",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                // backgroundColor: Colors.red,
                // textColor: Colors.white,
                fontSize: 16.0);
          },
          unauthenticated: (message) => Fluttertoast.showToast(
              msg: message.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              // backgroundColor: Colors.red,
              // textColor: Colors.white,
              fontSize: 16.0));
    });

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 121),
                  SizedBox(
                    width: 94,
                    height: 121,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tesfa Bank",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // Email TextField
                          Consumer(
                            builder: (context, ref, _) {
                              final emailField = ref
                                  .watch(loginFormNotifierProvider)
                                  .form
                                  .email;
                              return CustomTextField(
                                onChanged: (value) => ref
                                    .read(loginFormNotifierProvider.notifier)
                                    .setEmail(value),
                                controller: email,
                                labelText: "Enter your Email",
                                errorMessage: emailField.errorMessage,
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          // Password TextField
                          Consumer(
                            builder: (context, ref, _) {
                              final passwordField = ref
                                  .watch(loginFormNotifierProvider)
                                  .form
                                  .password;
                              return CustomTextField(
                                isPassword: true,
                                onChanged: (value) => ref
                                    .read(loginFormNotifierProvider.notifier)
                                    .setPassword(value),
                                controller: password,
                                labelText: "Enter your Password",
                                errorMessage: passwordField.errorMessage,
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          // Navigation Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('Not a member?'),
                              TextButton(
                                onPressed: () => context.go("/signup"),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade300),
                                ),
                              ),
                              const SizedBox(width: 30),
                              TextButton(
                                onPressed: () => context.go("/password_reset"),
                                child: Text('Forgot Password?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade300)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Sign In Button
                          Center(
                            child: Consumer(builder: (context, ref, _) {
                              final field =
                                  ref.watch(loginFormNotifierProvider).form;
                              return CustomButton(
                                isDisabled: !(field.password.isValid &&
                                    field.email.isValid),
                                title: 'Sign in',
                                loading:
                                    ref.watch(authNotifierProvider).maybeWhen(
                                          orElse: () => false,
                                          loading: () => true,
                                        ),
                                onPressed: () => ref
                                    .read(authNotifierProvider.notifier)
                                    .login(
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                    ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
