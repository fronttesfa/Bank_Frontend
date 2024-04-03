import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//password visibility state handler
final visibilityProvider = StateProvider<bool>((ref) => true);

class CustomTextField extends ConsumerWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.labelText,
      this.errorMessage,
      this.isPassword = false,
      required this.onChanged});

  final TextEditingController controller;

  // final String hintText;
  final String labelText;
  final String? errorMessage;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          keyboardType: keyboardType,
          obscureText: isPassword ? ref.watch(visibilityProvider) : isPassword,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: isPassword ? const EdgeInsets.all(8) : null,
            // hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff070101),
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: labelText,
            suffix: isPassword
                ? IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      ref.watch(visibilityProvider)
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                    ),
                    color: Colors.grey,
                    onPressed: () {
                      ref.read(visibilityProvider.notifier).state =
                          !ref.watch(visibilityProvider);
                    },
                  )
                : null,
          ),
        ),
        const SizedBox(height: 8),
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
