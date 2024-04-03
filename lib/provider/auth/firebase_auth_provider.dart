import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// final authenticationProvider = Provider((ref) {
//   return FirebaseAuth.instance;
// });
//
// final authStateProvider = StreamProvider<User?>((ref) {
//   return ref.read(firebaseAuthProvider).authStateChange;
// });

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
