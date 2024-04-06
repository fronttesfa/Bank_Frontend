import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_end/models/transaction.dart';
import 'package:front_end/screens/deposit/deposit_main.dart';
import 'package:front_end/widgets/drop_down_card.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

// Transacion list
  final List<Transaction> transactionList = [
    Transaction(
      name: 'Robert Fox',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder-2.png",
      isWithdraw: true,
    ),
    Transaction(
      name: 'Robert Fox',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder-1.png",
      isWithdraw: true,
    ),
    Transaction(
      name: 'Robert Fox',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder-3.png",
      isWithdraw: false,
    ),
    Transaction(
      name: 'Robert Fox',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder.png",
      isWithdraw: true,
    ),
    Transaction(
      name: 'Robert Fox',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder-1.png",
      isWithdraw: true,
    ),
    Transaction(
      name: 'Robert Fox',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder-2.png",
      isWithdraw: false,
    ),
    Transaction(
      name: 'Robert Fox',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder-3.png",
      isWithdraw: true,
    ),
    Transaction(
      name: 'Berhan Adhana',
      date: '23 January 2021',
      amount: '396.84',
      imageUrl: "assets/images/dummy/image-placeholder.png",
      isWithdraw: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            AccordionCard(),
            // Qucik access buttons

            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    quickButtons(() {}, "Send", Icons.send, isangled: true),
                    quickButtons(
                        () {}, "Transfer", Icons.transfer_within_a_station),
                    quickButtons(() {}, "Pay", Icons.payment),
                    Column(
                      children: [
                        Container(
                          // width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 2.0, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 56,
                          height: 56,
                          child: IconButton(
                              onPressed: () => context.go('/deposit_main'),
                              icon: Icon(Icons.qr_code)),
                        ),
                        Text(
                          'Deposit',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Recent contact section

            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SeeAll(
                          label: "Send To ",
                          buttonLabel: "See all",
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Got to Send To Page");
                          }),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            quickButtons(
                              () {},
                              "Add Reciver",
                              Icons.add,
                            ),
                            quickButtons(() {}, "Jim ", null,
                                imageUri:
                                    "assets/images/dummy/image-placeholder-2.png"),
                            quickButtons(() {}, "Kim ", null,
                                imageUri:
                                    "assets/images/dummy/image-placeholder-3.png"),
                            quickButtons(() {}, "Bil ", null,
                                imageUri:
                                    "assets/images/dummy/image-placeholder-1.png"),
                            quickButtons(() {}, "Phi", null,
                                imageUri:
                                    "assets/images/dummy/image-placeholder.png"),
                            quickButtons(() {}, "Sia ", null,
                                imageUri:
                                    "assets/images/dummy/image-placeholder-1.png"),
                            quickButtons(() {}, "Lia", null,
                                imageUri:
                                    "assets/images/dummy/image-placeholder.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SeeAll(
                          label: "History Transaction ",
                          buttonLabel: "See all",
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Got to History Transaction Page");
                          }),
                      Expanded(
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: transactionList.length,
                          itemBuilder: (context, index) {
                            final transaction = transactionList[index];
                            return ListTile(
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "${transaction.name} transaction is clicked");
                              },
                              leading: Image.asset(transaction.imageUrl),
                              title: Text(transaction.name),
                              subtitle: Text(
                                transaction.date,
                                // style: const TextStyle(color: Colors.white38),
                              ),
                              trailing: Text(
                                "${transaction.isWithdraw ? "-" : "+"}\$${transaction.amount}",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: transaction.isWithdraw
                                        ? Colors.red
                                        : null),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget quickButtons(Function onPressed, String label, IconData? icon,
      {bool isangled = false, String? imageUri}) {
    return Column(
      children: [
        CustomContainer(
            image: imageUri,
            child: Transform(
              alignment: Alignment.center,
              transform:
                  isangled ? Matrix4.rotationZ(12) : Matrix4.rotationZ(0),
              // origin: Offset.zero,
              child: IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "$label clicked");
                  },
                  icon: Icon(icon)),
            )),
        Text(
          label,
          style: const TextStyle(),
        ),
      ],
    );
  }
}

class _SeeAll extends StatelessWidget {
  _SeeAll({
    super.key,
    required this.label,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String label;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      TextButton(
        onPressed: onPressed,
        child: Text(buttonLabel,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor)),
      ),
    ]);
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      // color: Colors.white,
      shadowColor: Colors.grey,
      // surfaceTintColor: Colors.transparent,
      // elevation: 5.0,
      child: child,
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  final String? image;

  const CustomContainer({super.key, required this.child, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(

          image: image == null
              ? null
              : DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(image ?? "")),
          border: Border.all(width: 2.0, color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(8.0)),
      width: 56,
      height: 56,
      child: child,
    );
  }
}
