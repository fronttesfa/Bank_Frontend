
import 'package:front_end/extensions/validator.dart';
import 'package:front_end/models/field.dart';
import 'package:front_end/models/login_schema.dart';
import 'package:front_end/provider/state/app_form_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';


class LoginFormNotifier extends StateNotifier<AppFormState<LoginSchema>> {
  LoginFormNotifier() : super(AppFormState(LoginSchema.empty()));

  void setEmail(String email) {

    final form = state.form.copyWith(email: Field(value: email));
    late Field<String> emailField;

    final isEmailValid = email.validateEmail();
    if (email.isEmpty) {
      emailField =
          form.email.copyWith(value: email, errorMessage: null, isValid: false);
    } else if (isEmailValid) {
      emailField =
          form.email.copyWith(value: email, errorMessage: null, isValid: true);
    } else {
      emailField = form.email.copyWith(
        value: email,
        errorMessage: 'Enter Valid Email',
        isValid: false,
      );
    }
    state = state.copyWith(form: form.copyWith(email: emailField));
  }

  void setPassword(String password) {
    final form = state.form.copyWith(password: Field(value: password));
    late Field<String> passwordField;
    final isPasswordValid = password.validatePassword();
    if (password.isEmpty) {
      passwordField = form.password
          .copyWith(value: password, errorMessage: null, isValid: false);
    } else if (isPasswordValid) {
      passwordField = form.password
          .copyWith(value: password, errorMessage: null, isValid: true);
    } else {
      passwordField = form.password.copyWith(
        value: password,
        errorMessage: 'Enter Valid Password',
        isValid: false,
      );
    }
    state = state.copyWith(form: form.copyWith(password: passwordField));
  }
}

final loginFormNotifierProvider =
StateNotifierProvider<LoginFormNotifier, AppFormState<LoginSchema>>((ref) {
  return LoginFormNotifier();
});
