import 'package:flutter/material.dart';
import 'package:front_end/widgets/Password%20Reset/password_reset_entry_form.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key, required this.email});

  final String email;

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  bool disabled = true;
  late String otp;
  String? error;

  bool isDisabled(String pin) {
    if (pin.length == 6) {
      setState(() {
        disabled = false;
      });
      otp = pin;
      return disabled;
    }
    setState(() {
      disabled = true;
      error = null;
    });

    return disabled;
  }

//this method is for the real implementation
  Future<bool> validate(String pin) async {
    try {
      // Map<String,String> data = {}
      String body = json.encode({'data': pin});
      Uri url = Uri.http('', '');
      await http.post(url,
          body: body,
          headers: <String, String>{'Content-Type': 'application/json'});
      return true;
    } catch (e) {
      setState(() {
        error = e.toString();
      });
      return false;
    }
  }

//test implementation until the backend is implemented
  bool tempValidate(String pin) {
    if (pin == '555555') {
      return true;
    }
    setState(() {
      error = 'Verification failed';
    });
    return false;
  }

  var defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: TextStyle(color: Colors.black87),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Verification Code'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                // child: Text(
                //   'Please enter the code received in this email: ${widget.email}',
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.bodyLarge,
                // ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: <TextSpan>[
                        const TextSpan(
                            text:
                                'Please enter the code received in this email: '),
                        TextSpan(
                            text: '${widget.email}',
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                keyboardType: TextInputType.phone,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.circular(8),
                ),
                onChanged: (pin) => {isDisabled(pin)},
                validator: (pin) {
                  if (tempValidate(pin!)) {
                    return null;
                  } else {
                    return 'verification failed';
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Verify',
                isDisabled: disabled,
                onPressed: () => {
                  tempValidate(otp)
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()),
                        )
                      : null
                },
              )
            ],
          ),
        ));
  }
}
