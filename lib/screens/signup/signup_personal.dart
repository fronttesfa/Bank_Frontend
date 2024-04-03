import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:front_end/provider/auth/authentication_provider.dart';
import 'package:front_end/provider/auth/personal_info_form_provider.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});
final dateProvider = StateProvider<String>((ref) {
  return "";
});

class SignUpPersonal extends HookConsumerWidget {
  const SignUpPersonal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phone = useTextEditingController(
        text: ref.watch(personalInfoFormNotifierProvider).form.phone.value);
    final gender = useTextEditingController(
        text: ref.watch(personalInfoFormNotifierProvider).form.gender.value);
    final dateInput = useTextEditingController();
    final sin = useTextEditingController();
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          context.go("/login");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Authenticated'),
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

                Consumer(
                  builder: (context, ref, _) {
                    dateInput.text = ref.watch(dateProvider);
                    final dateField = ref
                        .watch(personalInfoFormNotifierProvider)
                        .form
                        .dateOfBirth;
                    return TextField(
                        controller: dateInput,
                        //editing controller of this TextField
                        decoration: InputDecoration(
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
                            prefixIcon: const Icon(
                                Icons.calendar_today), //icon of text field
                            labelText: "Date of Birth" //label text of field
                            ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            //formatted date output using intl package =>  2021-03-16
                            ref.watch(dateProvider.notifier).state =
                                formattedDate;
                            ref
                                .read(personalInfoFormNotifierProvider.notifier)
                                .setDateOfBirth(pickedDate.toString());
                          } else {}
                        });
                  },
                ),
                const SizedBox(height: 10.0,),
                Consumer(
                  builder: (context, ref, _) {
                    // final postalField = ref
                    //     .watch(addressInfoFormNotifierProvider)
                    //     .form
                    //     .postalCode;
                    return CustomTextField(
                      onChanged: (value) => {
                        // ref
                        //     .read(addressInfoFormNotifierProvider.notifier)
                        //     .setCountryStateCity(
                        //     country.text, state.text, city.text),
                        // ref
                        //     .read(addressInfoFormNotifierProvider.notifier)
                        //     .setPostalCode(value)
                      },
                      controller: sin,
                      // hintText: 'Email',
                      labelText: "Enter SIN",
                      // errorMessage: postalField.errorMessage,
                    );
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final genderField =
                        ref.watch(personalInfoFormNotifierProvider).form.gender;
                    return DropdownButton(
                      isExpanded: true,
                        items: genderList,
                        value: ref
                            .watch(personalInfoFormNotifierProvider)
                            .form
                            .gender
                            .value,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        borderRadius: BorderRadius.circular(8.0),
                        onChanged: (value) => {
                              ref
                                  .read(
                                      personalInfoFormNotifierProvider.notifier)
                                  .setGender(value!)
                            });
                    // CustomTextField(
                    //   onChanged: (value) => {
                    //     //  ref
                    //     //   .read(loginFormNotifierProvider.notifier)
                    //     //   .setEmail(value)
                    //   },
                    //   controller: gender,
                    //   // hintText: 'Email',
                    //   labelText: "Gender",
                    //   // errorMessage: emailField.errorMessage,
                    // );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final phoneField =
                        ref.watch(personalInfoFormNotifierProvider).form.phone;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 150.0,
                          child: CountryCodePicker(
                            padding: EdgeInsets.zero,
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IT',
                            favorite: ['+39', 'FR'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: true,
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            keyboardType: TextInputType.phone,
                            onChanged: (value) => {
                              ref
                                  .read(
                                      personalInfoFormNotifierProvider.notifier)
                                  .setPhone(value)
                            },
                            controller: phone,
                            // hintText: 'Email',
                            labelText: "Phone",
                            errorMessage: phoneField.errorMessage,
                          ),
                        )
                      ],
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

List<DropdownMenuItem<String>> get genderList {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
      value: "male",
      child: Container(
        constraints: BoxConstraints(minHeight: 48.0),
        child: Text("Male"),
        decoration: const BoxDecoration(),
      ),
    ),
    DropdownMenuItem(
      value: "female",
      child: Container(
        // alignment: Alignment.center,
constraints: BoxConstraints(minHeight: 48.0),
        child: Text("Female"),
        decoration: BoxDecoration(),
      ),
    )
  ];
  return menuItems;
}
