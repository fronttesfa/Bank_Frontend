import 'package:front_end/models/address_schema.dart';
import 'package:front_end/models/field.dart';
import 'package:front_end/provider/state/app_form_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddressInfoFormNotifier
    extends StateNotifier<AppFormState<AddressSchema>> {
  AddressInfoFormNotifier() : super(AppFormState(AddressSchema.empty()));

  void setCountryStateCity(String country, String state_name, String city) {
    final form = state.form.copyWith(
        country: Field(value: country),
        stateName: Field(value: state_name),
        city: Field(value: city));

    late Field<String> countryField;
    late Field<String> stateField;
    late Field<String> cityField;

    if (country.isEmpty) {
      countryField = form.country
          .copyWith(value: country, errorMessage: null, isValid: false);
    } else if (state_name.isEmpty) {
      stateField = form.stateName
          .copyWith(value: state_name, errorMessage: null, isValid: false);
    } else if (city.isEmpty) {
      cityField =
          form.city.copyWith(value: city, errorMessage: null, isValid: false);
    } else {
      countryField = form.country
          .copyWith(value: country, errorMessage: null, isValid: true);
      stateField = form.stateName
          .copyWith(value: state_name, errorMessage: null, isValid: true);
      cityField =
          form.city.copyWith(value: city, errorMessage: null, isValid: true);
    }
    state = state.copyWith(
        form: form.copyWith(
            country: countryField, stateName: stateField, city: cityField));
  }

  void setStreet(String street) {
    final form = state.form.copyWith(street: Field(value: street));
    late Field<String> streetField;
    if (street.isEmpty) {
      streetField = form.street
          .copyWith(value: street, errorMessage: null, isValid: false);
    } else {
      streetField = form.street
          .copyWith(value: street, errorMessage: null, isValid: true);
    }

    state = state.copyWith(form: form.copyWith(street: streetField));
  }

  void setPostalCode(String postalCode) {
    final form = state.form.copyWith(postalCode: Field(value: postalCode));
    late Field<String> postalField;
    if (postalCode.isEmpty) {
      postalField = form.postalCode
          .copyWith(value: postalCode, errorMessage: null, isValid: false);
    } else {
      postalField = form.postalCode
          .copyWith(value: postalCode, errorMessage: null, isValid: true);
    }

    state = state.copyWith(form: form.copyWith(postalCode: postalField));
  }
}

final addressInfoFormNotifierProvider =
    StateNotifierProvider<AddressInfoFormNotifier, AppFormState<AddressSchema>>(
        (ref) {
  return AddressInfoFormNotifier();
});
