import 'package:front_end/extensions/validator.dart';
import 'package:front_end/widgets/Password%20Reset/password_reset_verification_code.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController _emailController = TextEditingController();

  bool loading = false;
  bool disabled = true;
  String error = '';

  void checkEmailField() {
    setState(() {
      disabled = !(_emailController.text.isNotEmpty);
    });
  }

  bool validation(String testing) {
    bool valid = testing.validateEmail();
    if (!valid) {
      setState(() {
        error = 'Email address incorrectly formatted';
      });
    }
    return valid;
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  SnackBar customSnackBar(String text, Duration duration) {
    return SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      duration: duration,
    );
  }
//not needed for future local backend
  // Future passwordReset() async {
  //   try {
  //     loading = true;
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: _emailController.text.trim());
  //     loading = false;
  //     ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
  //         'Reset Link has been sent', const Duration(seconds: 5)));
  //     context.go('/login');
  //   } on FirebaseAuthException catch (e) {
  //     loading = false;
  //     setState(() {
  //       error = e.message.toString();
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       customSnackBar(
  //         error,
  //         const Duration(seconds: 3),
  //       ),
  //     );
  //
  //   }
  // }

//To be modified when the backend is implemented
  void passwordReset() async {
    if (validation(_emailController.text.trim())) {
      return;
    }
    try {
      loading = true;
      var url = Uri.http('', '');
      var respons = await http.post(url);
      loading = false;
    } catch (e) {
      loading = false;
      setState(() {
        error = e.toString();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          error,
          const Duration(seconds: 3),
        ),
      );
    }
  }

  void setError(String e) {
    if (e.isNotEmpty) {
      error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Enter Your email address',
            style: TextStyle(),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter you email and we will send you a link to reset your password',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: _emailController,
                errorMessage: error.isEmpty ? null : error,
                labelText: "Enter email",
                onChanged: (String _emailController) => {checkEmailField()}),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: loading
                        ? null
                        : () {
                            context.go('/login');
                          },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.lightBlue[300],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  loading: loading,
                  title: 'Reset',
                  isDisabled: disabled,
                  onPressed: () {
                    if (validation(_emailController.text.trim())) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VerificationCode(
                              email: _emailController.text.trim()),
                        ),
                      );
                    }
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
