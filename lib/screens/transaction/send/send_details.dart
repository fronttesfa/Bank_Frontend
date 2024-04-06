import 'package:flutter/material.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SendDetails extends HookConsumerWidget {
  const SendDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = useTextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go("/send"),
          ),
          elevation: 8,
          title: const Text("Verify"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.info),
                subtitle: Text(
                    "By taping 'send Money', you are agree that you have reviewed and confirmed the information below. Your transfer is final and irrevocable once sent and cannot be cancelled."),
              ),
              Text(
                "Review Details",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ListTile(
                onTap: () {},
                leading: Text(
                  "Sender",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                title: const Text(
                  "Berhan",
                  textAlign: TextAlign.right,
                ),
                subtitle: const Text(
                  "berhan@gmail.com",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Text(
                  "From Account",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                title: const Text(
                  "EVERY DAY SAVING ACCOUNT",
                  textAlign: TextAlign.right,
                ),
                subtitle: const Text(
                  "6023782",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Text(
                  "Recipent",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                title: const Text(
                  "Jhon Smith",
                  textAlign: TextAlign.right,
                ),
                subtitle: const Text(
                  "jhon@gmail.com",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Text(
                  "Amount",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                title: const Text(
                  "\$5.0",
                  textAlign: TextAlign.right,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Text(
                  "Transfer Fee",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                title: const Text(
                  "\$0.05",
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      isDisabled: false,
                      onPressed: () => {},
                      title: "Cancel", // errorMessage: emailField.errorMessage,
                    ),
                    CustomButton(
                      isDisabled: false,
                      onPressed: () => {context.go("/send_success")},
                      title: "Send Money",
                      // errorMessage: emailField.errorMessage,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
