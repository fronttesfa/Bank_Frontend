import 'package:flutter/material.dart';
import 'package:front_end/provider/auth/account_info_form_provider.dart';

import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class SignUp extends HookConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fNmae = useTextEditingController();
    final lName = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();
    final confirmPassword = useTextEditingController();

    // ref.listen(authNotifierProvider, (previous, next) {
    //   next.maybeWhen(
    //     orElse: () => null,
    //     authenticated: (user) {
    //       context.go("/login");
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(
    //           content: Text('User Authenticated'),
    //           behavior: SnackBarBehavior.floating,
    //         ),
    //       );
    //     },
    //     unauthenticated: (message) =>
    //         ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(message!),
    //         behavior: SnackBarBehavior.floating,
    //       ),
    //     ),
    //   );
    // });
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: 94,
            height: 121,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Consumer(
                  builder: (context, ref, _) {
                    final fNameField =
                        ref.watch(accountInfoFormNotifierProvider).form.fName;
                    return CustomTextField(
                      onChanged: (value) => {
                        ref
                            .read(accountInfoFormNotifierProvider.notifier)
                            .setFName(value)
                      },
                      controller: fNmae,
                      // hintText: 'Email',
                      labelText: "First Name",
                      errorMessage: fNameField.errorMessage,
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final lNameField =
                        ref.watch(accountInfoFormNotifierProvider).form.lName;
                    return CustomTextField(
                      onChanged: (value) => {
                        ref
                            .read(accountInfoFormNotifierProvider.notifier)
                            .setLName(value)
                      },
                      controller: lName,
                      // hintText: 'Email',
                      labelText: "Last Name",
                      errorMessage: lNameField.errorMessage,
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final emailField =
                        ref.watch(accountInfoFormNotifierProvider).form.email;
                    return CustomTextField(
                      onChanged: (value) => {
                        ref
                            .read(accountInfoFormNotifierProvider.notifier)
                            .setEmail(value)
                      },
                      controller: email,
                      // hintText: 'Email',
                      labelText: "Enter your Email",
                      errorMessage: emailField.errorMessage,
                    );
                  },
                ),

                // const SizedBox(
                //   height: 20,
                // ),

                Consumer(
                  builder: (context, ref, _) {
                    final passwordField = ref
                        .watch(accountInfoFormNotifierProvider)
                        .form
                        .password;
                    return CustomTextField(
                      isPassword: true,
                      onChanged: (value) => {
                        ref
                            .read(accountInfoFormNotifierProvider.notifier)
                            .setPassword(value)
                      },
                      controller: password,
                      // hintText: 'Email',
                      labelText: "Enter your Password",
                      errorMessage: passwordField.errorMessage,
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final confirmPasswordField = ref
                        .watch(accountInfoFormNotifierProvider)
                        .form
                        .confirmPassword;
                    return CustomTextField(
                      isPassword: true,
                      onChanged: (value) => {
                        ref
                            .read(accountInfoFormNotifierProvider.notifier)
                            .setConfirmPassword(value)
                      },
                      controller: confirmPassword,
                      // hintText: 'Email',
                      labelText: "Confirm Password",
                      errorMessage: confirmPasswordField.errorMessage,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
