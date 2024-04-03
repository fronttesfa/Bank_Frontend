import 'package:flutter/material.dart';
import 'package:front_end/provider/auth/account_info_form_provider.dart';
import 'package:front_end/provider/auth/address_info_form.dart';
import 'package:front_end/provider/auth/authentication_provider.dart';
import 'package:front_end/provider/auth/personal_info_form_provider.dart';

import 'package:front_end/screens/signup/signup.dart';
import 'package:front_end/screens/signup/signup_personal.dart';
import 'package:front_end/screens/signup/signup_address.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//provider for controlling the current step
final currentStepProvider = StateProvider<int>((ref) {
  return 0;
});

class SignupStepper extends HookConsumerWidget {
  SignupStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Stepper(
            // margin: const EdgeInsets.only(top: 15.0),
            elevation: 0,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Consumer(builder: (context, ref, _) {
                        final accountInfo =
                            ref.watch(accountInfoFormNotifierProvider).form;
                        final personalInfo =
                            ref.watch(personalInfoFormNotifierProvider).form;
                        final addressInfo =
                            ref.watch(addressInfoFormNotifierProvider).form;

                        return CustomButton(
                            isDisabled: ref.watch(currentStepProvider) == 0 &&
                                    !(accountInfo.fName.isValid &&
                                        accountInfo.lName.isValid &&
                                        accountInfo.email.isValid &&
                                        accountInfo.password.isValid &&
                                        accountInfo.confirmPassword.isValid) ||
                                ref.watch(currentStepProvider) == 1 &&
                                    !(personalInfo.dateOfBirth.isValid &&
                                        // personalInfo.gender.isValid &&
                                        personalInfo.phone.isValid) ||
                                ref.watch(currentStepProvider) == 2 &&
                                    !(addressInfo.country.isValid &&
                                        addressInfo.stateName.isValid &&
                                        addressInfo.city.isValid &&
                                        addressInfo.street.isValid &&
                                        addressInfo.postalCode.isValid),

                            // backgroundColor: Colors.black,
                            title: ref.watch(currentStepProvider) == 2
                                ? 'Sign Up'
                                : 'Continue',
                            loading: ref.watch(currentStepProvider) == 2 &&
                                ref.watch(authNotifierProvider).maybeWhen(
                                    orElse: () => false, loading: () => true),
                            onPressed: () {
                              if (ref.watch(currentStepProvider) == 2) {
                                // print("SIgnup here");
                                ref.read(authNotifierProvider.notifier).signup(
                                      email: accountInfo.email.value,
                                      password: accountInfo.password.value,
                                    );
                              } else {
                                details.onStepContinue!();
                              }
                            });
                      }),
                      Consumer(builder: (context, ref, _) {
                        // final field =
                        //     ref.watch(loginFormNotifierProvider).form;
                        return CustomButton(
                            isDisabled: (ref.watch(currentStepProvider) == 0)
                                ? true
                                : false,
                            //  !(field.password.isValid &&
                            //     field.email.isValid),
                            // backgroundColor: Colors.black,
                            title: 'Back',
                            // loading: ref.watch(authNotifierProvider).maybeWhen(
                            //     orElse: () => false, loading: () => true),
                            onPressed: details.onStepCancel);
                      })
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                      onPressed: () {
                        context.go("/login");
                      },
                      child: Text("Already Signed up? Sign In"))
                ],
              );
            },
            type: StepperType.horizontal,
            currentStep: ref.watch(currentStepProvider),
            onStepCancel: () => ref.watch(currentStepProvider) == 0
                ? null
                : ref.read(currentStepProvider.notifier).state =
                    ref.watch(currentStepProvider) - 1,
            onStepContinue: () {
              bool isLastStep =
                  (ref.watch(currentStepProvider) == getSteps(ref).length - 1);
              if (isLastStep) {
                ref.read(authNotifierProvider.notifier).signup(
                      email: "",
                      password: "",
                    );
              } else {
                ref.read(currentStepProvider.notifier).state =
                    ref.watch(currentStepProvider) + 1;
              }
            },
            // onStepTapped: (step) =>{}
            //     ref.read(currentStepProvider.notifier).state = step,
            steps: getSteps(ref),
          )),
    );
  }

  List<Step> getSteps(WidgetRef ref) {
    return <Step>[
      Step(
        state: ref.watch(currentStepProvider) > 0
            ? StepState.complete
            : StepState.indexed,
        isActive: ref.watch(currentStepProvider) >= 0,
        title: const Text(
          "Account Info",
          style: TextStyle(fontSize: 12.0),
        ),
        content: const SignUp(),
      ),
      Step(
        state: ref.watch(currentStepProvider) > 1
            ? StepState.complete
            : StepState.indexed,
        isActive: ref.watch(currentStepProvider) >= 1,
        title: const Text(
          "Personal Info",
          style: TextStyle(fontSize: 12.0),
        ),
        content: const SignUpPersonal(),
      ),
      Step(
        state: ref.watch(currentStepProvider) > 2
            ? StepState.complete
            : StepState.indexed,
        isActive: ref.watch(currentStepProvider) >= 2,
        title: const Text(
          "Address",
          style: TextStyle(fontSize: 12.0),
        ),
        content: const SignUpAddress(),
      ),
    ];
  }
}
