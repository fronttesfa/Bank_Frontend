import 'package:front_end/extensions/validator.dart';
import 'package:front_end/models/field.dart';

import 'package:front_end/models/personal_info_schema.dart';
import 'package:front_end/provider/state/app_form_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class PersonalInfoFormNotifier
    extends StateNotifier<AppFormState<PersonalInfoSchema>> {
  PersonalInfoFormNotifier() : super(AppFormState(PersonalInfoSchema.empty()));

  void setDateOfBirth(String dob) {
    final form = state.form.copyWith(dateOfBirth: Field(value: dob));
    late Field<String> dobField;

    // final isDateOfBirthValid =
    //     DateTime.now().year - 18 >= DateFormat().parseUtc(dob).year;
    if (dob.isEmpty) {
      dobField = form.dateOfBirth
          .copyWith(value: dob, errorMessage: null, isValid: false);
      // } else if (isDateOfBirthValid) {
      //   dobField = form.dateOfBirth
      //       .copyWith(value: dob, errorMessage: null, isValid: true);
      //
    } else {
      dobField = form.dateOfBirth
          .copyWith(value: dob, errorMessage: null, isValid: true);
    }
    state = state.copyWith(form: form.copyWith(dateOfBirth: dobField));
  }

  void setGender(String gender) {
    final form = state.form.copyWith(gender: Field(value: gender));
    late Field<String> genderField =
        form.gender.copyWith(value: gender, errorMessage: null, isValid: true);
    state = state.copyWith(form: form.copyWith(gender: genderField));
  }

  void setPhone(String phone) {
    final form = state.form.copyWith(phone: Field(value: phone));
    late Field<String> phoneField;

    final isPhoneValid = phone.validatePhone();
    if (phone.isEmpty) {
      phoneField =
          form.phone.copyWith(value: phone, errorMessage: null, isValid: false);
    } else if (isPhoneValid) {
      phoneField =
          form.phone.copyWith(value: phone, errorMessage: null, isValid: true);
    } else {
      phoneField = form.phone.copyWith(
        value: phone,
        errorMessage: 'Enter Valid phone',
        isValid: false,
      );
    }
    state = state.copyWith(form: form.copyWith(phone: phoneField));
  }
}

final personalInfoFormNotifierProvider = StateNotifierProvider<
    PersonalInfoFormNotifier, AppFormState<PersonalInfoSchema>>((ref) {
  return PersonalInfoFormNotifier();
});
