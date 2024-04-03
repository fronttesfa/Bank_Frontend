import 'package:flutter/material.dart';
import 'package:front_end/extensions/validator.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var NewPassword = TextEditingController();
  var ConfirmPassword = TextEditingController();
  bool isReady = false;
  bool newPasswordTest = false;
  String errorNewPassword =
      '''Make sure your password fulfills the following:\n\t
        1) At least one uppercase letter (A-Z).\n\t
        2) At least one lowercase letter (a-z).\n\t
        3) At least one digit (0-9).\n\t
        4) At least one special character among !@#\$&*~.\n\t
        5) The password must be at least 6 characters long. ''';

  String? errorConfirmPassword;

  void buttonReady() {
    setState(() {
      isReady = NewPassword.value.text.isNotEmpty &&
          ConfirmPassword.value.text.isNotEmpty;
    });
  }

//This needs to be modified after the code implementation
  void resetPassword() {
    errorConfirmPassword = null;
    try {} catch (e) {}
    ;
    if (!NewPassword.value.text.toString().validatePassword()) {
      print('inside new password');
      setState(() {
        newPasswordTest = true;
      });
      return;
    }
    newPasswordTest = false;
    if (NewPassword.value.text.toString() ==
        ConfirmPassword.value.text.toString()) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Password reset')));
      context.go('/login');
    } else {
      print('inside mismatch');
      setState(() {
        errorConfirmPassword = 'Password mismatch';
      });
    }
  }

  @override
  void dispose() {
    NewPassword.dispose();
    ConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your new password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              CustomTextField(
                  controller: NewPassword,
                  labelText: 'New Password',
                  errorMessage: newPasswordTest ? errorNewPassword : null,
                  onChanged: (password) {
                    buttonReady();
                  }),
              SizedBox(height: 20),
              CustomTextField(
                  controller: ConfirmPassword,
                  labelText: 'Confirm Password',
                  errorMessage: errorConfirmPassword,
                  onChanged: (password) {
                    buttonReady();
                  }),
              SizedBox(
                height: 35,
              ),
              CustomButton(
                title: 'Reset',
                isDisabled: !isReady,
                onPressed: resetPassword,
              )
            ],
          ),
        )),
      ),
    );
  }
}
