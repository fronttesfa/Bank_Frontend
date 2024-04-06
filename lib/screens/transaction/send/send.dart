import 'package:flutter/material.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedFromIndex = StateProvider<int>((ref) {
  return 3;
});
final selectedToIndex = StateProvider<int>((ref) {
  return 3;
});

class Send extends ConsumerWidget {
  const Send({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _textEditingController =
        TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Send Money"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, _) {
                final seIndex = ref.watch(selectedFromIndex);
                return TextField(
                  minLines: 1,
                  onTap: () => {selectAccount(context, ref)},
                  readOnly: true,
                  decoration: InputDecoration(
                      isCollapsed: false,
                      suffix: Icon(Icons.arrow_drop_down),
                      border: OutlineInputBorder(),
                      hintText: seIndex < accounts.length
                          ? accounts[seIndex].name
                          : "Select account",
                      label: Text("From Account")),
                );
              }),
              const SizedBox(
                height: 24,
              ),
              Consumer(builder: (context, ref, _) {
                // final seIndex = ref.watch(selectedToIndex);
                return TextField(
                  minLines: 1,
                  onTap: () => {selectReciver(context, ref)},
                  readOnly: true,
                  decoration: const InputDecoration(
                      isCollapsed: false,
                      suffix: Icon(Icons.arrow_drop_down),
                      border: OutlineInputBorder(),
                      hintText: "Select account",
                      label: Text("To Account")),
                );
              }),
              const SizedBox(
                height: 24,
              ),
              Consumer(builder: (context, ref, _) {
                // final seIndex = ref.watch(selectedToIndex);
                return const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      isCollapsed: false,
                      border: OutlineInputBorder(),
                      hintText: "0.00",
                      label: Text("Amount")),
                );
              }),
              const SizedBox(
                height: 24,
              ),
              Consumer(builder: (context, ref, _) {
                // final seIndex = ref.watch(selectedToIndex);
                return const TextField(
                  decoration: InputDecoration(
                      isCollapsed: false,
                      border: OutlineInputBorder(),
                      hintText: "Don't include banking information",
                      label: Text("Message(Optional)")),
                );
              }),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                isDisabled: false,
                title: "Continue",
                onPressed: () => {context.go('/send_details')},
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectAccount(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Select an Account'),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    final account = accounts[index];
                    return ListTile(
                      onTap: () {
                        ref.read(selectedFromIndex.notifier).state = index;
                        Navigator.pop(context);
                      },
                      // leading: Image.asset(account.imageUrl),
                      title: Text(account.name),
                      subtitle: Text(
                        account.accountNumber,
                        // style: const TextStyle(color: Colors.black45),
                      ),
                      trailing: ref.watch(selectedFromIndex) == index
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void selectReciver(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Select an Account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // final account = accounts[index];
                    return ListTile(
                        onTap: () {
                          // ref.read(selectedIndex.notifier).state = index;
                          Navigator.pop(context);
                        },
                        // leading: Image.asset(account.imageUrl),
                        title: const Text("Berhan"),
                        subtitle: const Text(
                          "berhan@gmail.com",
                          // account.accountNumber,
                          // style: TextStyle(color: Colors.black45),
                        ));
                  },
                ),
                TextButton(
                  child: const Text('Add and Manage contacts'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Account {
  final String name;
  final String accountNumber;
  final String amount;

  Account({
    required this.name,
    required this.accountNumber,
    required this.amount,
  });
}

final List<Account> accounts = [
  Account(
    name: 'EVERY DAY SAVING ACCOUNT',
    accountNumber: '60378748',
    amount: '5000',
  ),
  Account(
    name: 'UNLIMITED CHEQUING ACCOUNT',
    accountNumber: '60378743',
    amount: '5000',
  )
];
