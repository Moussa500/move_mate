import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart';

enum PasswordValidationError {
  empty,
  invalid,
  short,
  noUpperCase,
  noLowerCase,
  noDigit
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 8) {
      return PasswordValidationError.short;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return PasswordValidationError.noUpperCase;
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return PasswordValidationError.noLowerCase;
    }
    if (!value.contains(RegExp(r'[0.9]'))) {
      return PasswordValidationError.noDigit;
    }
    return null;
  }
}

enum EmailValidatorError { empty, invalid, noDomain }

class Email extends FormzInput<String, EmailValidatorError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  @override
  EmailValidatorError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidatorError.empty;
    }
    if (value.contains('@example.com')) {
      return EmailValidatorError.empty;
    }
    if (!_emailRegex.hasMatch(value)) {
      return EmailValidatorError.noDomain;
    }
    if (!_emailRegex.hasMatch(value)) {
      return EmailValidatorError.invalid;
    }
    return null;
  }
}

enum NameValidatorError { empty, invalid }

class Name extends FormzInput<String, NameValidatorError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();
  @override
  NameValidatorError? validator(String value) {
    if (value.isEmpty) {
      return NameValidatorError.empty;
    }
    if (!value.isAlpha) {
      return NameValidatorError.invalid;
    }
    return null;
  }
}

enum UserNameValidator { empty, invalid }
class UserName extends FormzInput<String, UserNameValidator> {
  const UserName.pure() : super.pure('');
  const UserName.dirty([super.value = '']) : super.dirty();

  @override
  UserNameValidator? validator(String value) {
    if (value.isEmpty) {
      return UserNameValidator.empty;
    }
    // Use the `isAlphanumeric` function from the `string_validator` package
    if (!isAlphanumeric(value)) {
      return UserNameValidator.invalid;
    }
    return null;
  }
}