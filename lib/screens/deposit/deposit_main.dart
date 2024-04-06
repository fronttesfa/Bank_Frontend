import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DepositMain extends StatelessWidget {
  const DepositMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Check'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
            context.go('/dashboard');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => context.go("/deposit_second"),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(10),
                child: const Row(children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deposit Checkque',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Take a photo of your cheque to deposite it to your account',
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(10),
                child: const Row(children: [
                  Icon(
                    Icons.history,
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile Deposit History',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View a recent history of your mobile deposits',
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
