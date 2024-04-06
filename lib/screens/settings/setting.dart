import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:front_end/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class Setting extends ConsumerWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      // child: ElevatedButton(
      //     onPressed: () {
      //       FirebaseAuth.instance.signOut();
      //       context.go("/login");
      //     },
      //     child: Text("Log Out"))

      child: CustomButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          context.go("/login");
        },
        isDisabled: false,
        title: "Log Out",
      ),
    );
    ;
  }
}
