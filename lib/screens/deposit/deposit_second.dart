import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/provider/deposit/deposit_provider.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_snacbar.dart';
import 'package:go_router/go_router.dart';

class DepositSecond extends ConsumerStatefulWidget {
  const DepositSecond({super.key});

  @override
  ConsumerState<DepositSecond> createState() => _DepositSecondState();
}

class _DepositSecondState extends ConsumerState<DepositSecond> {
  // selected account
  String? selectedAccount;
  // Drop down items
  List<String> accountList = ['Chequing Account', 'Saving Account'];

  // controller for the amount text field
  TextEditingController amountController = TextEditingController();

  // controller for the amount text field
  TextEditingController memoController = TextEditingController();

  // File for storing paycheck front side
  File? frontCheck;

  // File for storing paycheck back side
  File? backCheck;

  @override
  void dispose() {
    amountController.dispose();
    memoController.dispose();
    super.dispose();
  }

  void submit() {
    var boll = (ref.read(account.notifier).state == null ||
        ref.read(amount.notifier).state == null ||
        ref.read(checkBack.notifier).state == null ||
        ref.read(checkFront.notifier).state == null);

    if (ref.read(account.notifier).state == null ||
        ref.read(amount.notifier).state == null ||
        ref.read(checkBack.notifier).state == null ||
        ref.read(checkFront.notifier).state == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text(
                    'Please fill all of the fields as well as the pictures'),
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'))
                ],
              ));
    } else {
      ref.read(account.notifier).state = null;
      ref.read(amount.notifier).state = null;
      ref.read(checkBack.notifier).state = null;
      ref.read(checkFront.notifier).state = null;
      ref.read(memo.notifier).state = null;
      context.go('/deposit_main');
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          'Submitted',
          const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  void initState() {
    if (ref.read(amount.notifier).state != null) {
      amountController.text = ref.read(amount.notifier).state.toString();
    }
    if (ref.read(memo.notifier).state != null) {
      memoController.text = ref.read(memo.notifier).state.toString();
    }

    backCheck = ref.read(checkBack);
    frontCheck = ref.read(checkFront);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.go('/deposit_main');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                isExpanded: true,
                hint: const Text('Select an account'),
                value: ref.read(account.notifier).state ?? selectedAccount,
                items: accountList.map((account) {
                  return DropdownMenuItem(
                    value: account,
                    child: Text(account),
                  );
                }).toList(),
                onChanged: (accountValue) {
                  setState(
                    () {
                      ref.read(account.notifier).state = accountValue;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  hintText: 'Amount \$',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  ref.read(amount.notifier).state =
                      value.isEmpty ? null : int.parse(value);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: memoController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Memo (Optional)',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  ref.read(memo.notifier).state = value;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                  child: Text(
                'Take pictures of Cheques',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            if (frontCheck != null) {
                              ref.read(toCheck.notifier).state = true;
                              ref.read(whichCheck.notifier).state = 1;
                              context.go('/deposit_display');
                            } else {
                              ref.read(whichCheck.notifier).state = 1;
                              context.go('/deposit_camera');
                            }
                          },
                          icon: frontCheck == null
                              ? const Icon(Icons.camera_alt, size: 30)
                              : Image.file(
                                  frontCheck!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Front')
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            if (backCheck != null) {
                              ref.read(toCheck.notifier).state = true;
                              ref.read(whichCheck.notifier).state = 2;
                              context.go('/deposit_display');
                            } else {
                              ref.read(whichCheck.notifier).state = 2;
                              context.go('/deposit_camera');
                            }
                          },
                          icon: backCheck == null
                              ? const Icon(Icons.camera_alt, size: 30)
                              : Image.file(
                                  backCheck!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Back')
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              CustomButton(
                onPressed: submit,
                title: 'Continue',
                width: double.infinity,
                isDisabled: false,
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
