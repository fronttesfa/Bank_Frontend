import 'package:front_end/extensions/validator.dart';
import 'package:front_end/models/field.dart';
import 'package:front_end/models/login_schema.dart';
import 'package:front_end/models/account_info_schema.dart';
import 'package:front_end/provider/state/app_form_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountInfoFormNotifier
    extends StateNotifier<AppFormState<AccountInfoSchema>> {
  AccountInfoFormNotifier() : super(AppFormState(AccountInfoSchema.empty()));

  void setFName(String fName) {
    final form = state.form.copyWith(fName: Field(value: fName));
    late Field<String> fNameField;

    final isFNameValid = fName.validateName();
    if (fName.isEmpty) {
      fNameField =
          form.fName.copyWith(value: fName, errorMessage: null, isValid: false);
    } else if (isFNameValid) {
      fNameField =
          form.fName.copyWith(value: fName, errorMessage: null, isValid: true);
    } else {
      fNameField = form.fName.copyWith(
        value: fName,
        errorMessage: 'Enter Valid Name',
        isValid: false,
      );
    }
    state = state.copyWith(form: form.copyWith(fName: fNameField));
  }

  void setLName(String lName) {
    final form = state.form.copyWith(lName: Field(value: lName));
    late Field<String> lNameField;

    final islNameValid = lName.validateName();
    if (lName.isEmpty) {
      lNameField =
          form.lName.copyWith(value: lName, errorMessage: null, isValid: false);
    } else if (islNameValid) {
      lNameField =
          form.lName.copyWith(value: lName, errorMessage: null, isValid: true);
    } else {
      lNameField = form.lName.copyWith(
        value: lName,
        errorMessage: 'Enter Valid Nmame',
        isValid: false,
      );
    }
    state = state.copyWith(form: form.copyWith(lName: lNameField));
  }

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
        errorMessage: "Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character from the set !@#&*~",
        isValid: false,
      );
    }
    state = state.copyWith(form: form.copyWith(password: passwordField));
  }

  void setConfirmPassword(String password) {
    final form = state.form.copyWith(confirmPassword: Field(value: password));
    late Field<String> passwordField;
    final isPasswordValid = password == state.form.password.value;

    if (password.isEmpty) {
      passwordField = form.confirmPassword
          .copyWith(value: password, errorMessage: null, isValid: false);
    } else if (isPasswordValid) {
      passwordField = form.confirmPassword
          .copyWith(value: password, errorMessage: null, isValid: true);
    } else {
      passwordField = form.confirmPassword.copyWith(
        value: password,
        errorMessage: 'Password must match',
        isValid: false,
      );
    }
    state = state.copyWith(form: form.copyWith(confirmPassword: passwordField));
  }
}

final accountInfoFormNotifierProvider = StateNotifierProvider<
    AccountInfoFormNotifier,
    AppFormState<AccountInfoSchema>>((ref) {
  return AccountInfoFormNotifier();
});
