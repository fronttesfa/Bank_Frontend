import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:front_end/provider/auth/address_info_form.dart';
import 'package:front_end/provider/auth/authentication_provider.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:country_code_picker/country_code_picker.dart';

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class SignUpAddress extends HookConsumerWidget {
  const SignUpAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final street = useTextEditingController();
    final country = useTextEditingController();
    final state = useTextEditingController();
    final city = useTextEditingController();
    final postalCode = useTextEditingController();

    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          context.go("/login");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Registered Successfully'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        unauthenticated: (message) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message!),
            behavior: SnackBarBehavior.floating,
          ),
        ),
      );
    });
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: 94,
            height: 121,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CountryStateCityPicker(
                    country: country,
                    state: state,
                    city: city,
                    dialogColor: Colors.white,
                    textFieldDecoration: InputDecoration(
                        fillColor: Colors.blueGrey.shade100,
                        filled: true,
                        suffixIcon: const Icon(Icons.arrow_downward_rounded),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none))),
                const SizedBox(
                  height: 20.0,
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final streetField =
                        ref.watch(addressInfoFormNotifierProvider).form.street;
                    return CustomTextField(
                      onChanged: (value) => {
                        ref
                            .read(addressInfoFormNotifierProvider.notifier)
                            .setCountryStateCity(
                                country.text, state.text, city.text),
                        ref
                            .read(addressInfoFormNotifierProvider.notifier)
                            .setStreet(value)
                      },
                      controller: street,
                      // hintText: 'Email',
                      labelText: "Street",
                      errorMessage: streetField.errorMessage,
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final postalField = ref
                        .watch(addressInfoFormNotifierProvider)
                        .form
                        .postalCode;
                    return CustomTextField(
                      onChanged: (value) => {
                        ref
                            .read(addressInfoFormNotifierProvider.notifier)
                            .setCountryStateCity(
                                country.text, state.text, city.text),
                        ref
                            .read(addressInfoFormNotifierProvider.notifier)
                            .setPostalCode(value)
                      },
                      controller: postalCode,
                      // hintText: 'Email',
                      labelText: "Postal Code",
                      errorMessage: postalField.errorMessage,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
