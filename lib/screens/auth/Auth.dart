import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:front_end/screens/error.dart';
import 'package:front_end/screens/home/home.dart';
import 'package:front_end/screens/loading.dart';
import 'package:front_end/screens/auth/login.dart';




final authStateProvider=StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());

class Auth extends ConsumerWidget {
  const Auth({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) return const Home();
          return const Login();
        },
        error: (e, stackTrace) => ErrorScreen(e, stackTrace),
        loading: () => const LoadingScreen());
  }
}
