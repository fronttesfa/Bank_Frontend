import 'dart:io';
import 'package:flutter/material.dart';
import 'package:front_end/provider/deposit/deposit_provider.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DepositDisplay extends ConsumerWidget {
  const DepositDisplay({super.key});
  // {super.key, required this.location, required this.check});

  // final XFile? location;

  // final Function(XFile? image) check;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double oneTenthWidth = MediaQuery.of(context).size.width * 0.2;
    void delete() {
      if (ref.read(whichCheck) == 1) {
        ref.read(checkFront.notifier).state = null;
      } else if (ref.read(whichCheck) == 2) {
        ref.read(checkBack.notifier).state = null;
      }
    }

    File? location;
    if (ref.read(whichCheck) == 1) {
      location = ref.read(checkFront);
    } else if (ref.read(whichCheck) == 2) {
      location = ref.read(checkBack);
    } else {
      location = null;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Put the check inside the box'),
        leading: IconButton(
          onPressed: () {
            context.go('/deposit_camera');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: location == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No image'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    isDisabled: false,
                    title: 'Return',
                    onPressed: () => context.go('/deposit_second'),
                  )
                ],
              ),
            )
          : Stack(
              children: [
                Positioned.fill(
                  child: Image.file(
                    File(location.path),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: oneTenthWidth,
                    color: const Color.fromARGB(220, 178, 169, 169),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: oneTenthWidth,
                  left: oneTenthWidth,
                  child: Container(
                    height: oneTenthWidth,
                    color: const Color.fromARGB(220, 178, 169, 169),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: oneTenthWidth,
                    color: const Color.fromARGB(220, 178, 169, 169),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: oneTenthWidth,
                  right: oneTenthWidth,
                  child: Container(
                    height: oneTenthWidth,
                    color: const Color.fromARGB(220, 178, 169, 169),
                  ),
                ),
                Positioned(
                  left: oneTenthWidth,
                  right: oneTenthWidth,
                  top: oneTenthWidth,
                  bottom: oneTenthWidth,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 5)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.go('/deposit_second');
                          },
                          child: const Icon(Icons.done),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            delete();
                            if (ref.read(toCheck)) {
                              ref.read(toCheck.notifier).state = false;
                              context.go('/deposit_second');
                            } else {
                              context.go('/deposit_camera');
                            }
                          },
                          child: const Icon(Icons.remove_circle_outline_sharp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
