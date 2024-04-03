import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_snacbar.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class PasswordResetFirebase extends StatefulWidget {
  const PasswordResetFirebase({super.key});

  @override
  State<PasswordResetFirebase> createState() => _PasswordResetFirebaseState();
}

class _PasswordResetFirebaseState extends State<PasswordResetFirebase> {
  final TextEditingController _emailController = TextEditingController();

  bool loading = false;
  bool disabled = true;
  String error = '';

  void checkEmailField() {
    setState(() {
      disabled = !(_emailController.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      loading = true;
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      loading = false;
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          'Reset Link has been sent', const Duration(seconds: 5)));
      context.go('/login');
    } on FirebaseAuthException catch (e) {
      loading = false;
      setState(() {
        error = e.message.toString();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          error,
          const Duration(seconds: 3),
        ),
      );
      // sna
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
                  onPressed: passwordReset,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
