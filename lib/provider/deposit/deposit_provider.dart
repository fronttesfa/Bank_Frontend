import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final checkBack = StateProvider<File?>((ref) => null);
final checkFront = StateProvider<File?>((ref) => null);
final whichCheck = StateProvider<int>((ref) => 0);
final toCheck = StateProvider<bool>((ref) => false);
final account = StateProvider<String?>((ref) => null);
final amount = StateProvider<int?>((ref) => null);
final memo = StateProvider<String?>((ref) => null);
