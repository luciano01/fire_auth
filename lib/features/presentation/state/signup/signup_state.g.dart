// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpStore on SignUpState, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'SignUpState.isValid'))
      .value;

  late final _$errorMessageAtom =
      Atom(name: 'SignUpState.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isLoadingByEmailAtom =
      Atom(name: 'SignUpState.isLoadingByEmail', context: context);

  @override
  bool get isLoadingByEmail {
    _$isLoadingByEmailAtom.reportRead();
    return super.isLoadingByEmail;
  }

  @override
  set isLoadingByEmail(bool value) {
    _$isLoadingByEmailAtom.reportWrite(value, super.isLoadingByEmail, () {
      super.isLoadingByEmail = value;
    });
  }

  late final _$isLoadingByGoogleAtom =
      Atom(name: 'SignUpState.isLoadingByGoogle', context: context);

  @override
  bool get isLoadingByGoogle {
    _$isLoadingByGoogleAtom.reportRead();
    return super.isLoadingByGoogle;
  }

  @override
  set isLoadingByGoogle(bool value) {
    _$isLoadingByGoogleAtom.reportWrite(value, super.isLoadingByGoogle, () {
      super.isLoadingByGoogle = value;
    });
  }

  late final _$emailAtom = Atom(name: 'SignUpState.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignUpState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$repeatPasswordAtom =
      Atom(name: 'SignUpState.repeatPassword', context: context);

  @override
  String get repeatPassword {
    _$repeatPasswordAtom.reportRead();
    return super.repeatPassword;
  }

  @override
  set repeatPassword(String value) {
    _$repeatPasswordAtom.reportWrite(value, super.repeatPassword, () {
      super.repeatPassword = value;
    });
  }

  late final _$createUserWithEmailAndPasswordAsyncAction = AsyncAction(
      'SignUpState.createUserWithEmailAndPassword',
      context: context);

  @override
  Future<void> createUserWithEmailAndPassword() {
    return _$createUserWithEmailAndPasswordAsyncAction
        .run(() => super.createUserWithEmailAndPassword());
  }

  late final _$SignUpStateActionController =
      ActionController(name: 'SignUpState', context: context);

  @override
  dynamic updateEmail(String value) {
    final _$actionInfo = _$SignUpStateActionController.startAction(
        name: 'SignUpState.updateEmail');
    try {
      return super.updateEmail(value);
    } finally {
      _$SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePassword(String value) {
    final _$actionInfo = _$SignUpStateActionController.startAction(
        name: 'SignUpState.updatePassword');
    try {
      return super.updatePassword(value);
    } finally {
      _$SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateRepeatPassword(String value) {
    final _$actionInfo = _$SignUpStateActionController.startAction(
        name: 'SignUpState.updateRepeatPassword');
    try {
      return super.updateRepeatPassword(value);
    } finally {
      _$SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoadingByEmail: ${isLoadingByEmail},
isLoadingByGoogle: ${isLoadingByGoogle},
email: ${email},
password: ${password},
repeatPassword: ${repeatPassword},
isValid: ${isValid}
    ''';
  }
}
