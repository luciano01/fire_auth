// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on SignInState, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'SignInState.isValid'))
      .value;

  late final _$errorMessageAtom =
      Atom(name: 'SignInState.errorMessage', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'SignInState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isShowPasswordAtom =
      Atom(name: 'SignInState.isShowPassword', context: context);

  @override
  bool get isShowPassword {
    _$isShowPasswordAtom.reportRead();
    return super.isShowPassword;
  }

  @override
  set isShowPassword(bool value) {
    _$isShowPasswordAtom.reportWrite(value, super.isShowPassword, () {
      super.isShowPassword = value;
    });
  }

  late final _$emailAtom = Atom(name: 'SignInState.email', context: context);

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
      Atom(name: 'SignInState.password', context: context);

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

  late final _$signInWithEmailAndPasswordAsyncAction =
      AsyncAction('SignInState.signInWithEmailAndPassword', context: context);

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _$signInWithEmailAndPasswordAsyncAction.run(() =>
        super.signInWithEmailAndPassword(email: email, password: password));
  }

  late final _$SignInStateActionController =
      ActionController(name: 'SignInState', context: context);

  @override
  dynamic updateEmail(String value) {
    final _$actionInfo = _$SignInStateActionController.startAction(
        name: 'SignInState.updateEmail');
    try {
      return super.updateEmail(value);
    } finally {
      _$SignInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePassword(String value) {
    final _$actionInfo = _$SignInStateActionController.startAction(
        name: 'SignInState.updatePassword');
    try {
      return super.updatePassword(value);
    } finally {
      _$SignInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateIsShowPassword(bool value) {
    final _$actionInfo = _$SignInStateActionController.startAction(
        name: 'SignInState.updateIsShowPassword');
    try {
      return super.updateIsShowPassword(value);
    } finally {
      _$SignInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoading: ${isLoading},
isShowPassword: ${isShowPassword},
email: ${email},
password: ${password},
isValid: ${isValid}
    ''';
  }
}
