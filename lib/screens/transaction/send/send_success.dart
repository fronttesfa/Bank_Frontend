import 'package:flutter/material.dart';

class SendSuccess extends StatelessWidget {
  const SendSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/transaction/send_success.png"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Transfer Successfully to Jhon Smith",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "\$ 2500.00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
