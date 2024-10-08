// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_app.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoadingAppViewModel on _LoadingAppViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_LoadingAppViewModelBase.isLoading', context: context);

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

  late final _$autoLoginAsyncAction =
      AsyncAction('_LoadingAppViewModelBase.autoLogin', context: context);

  @override
  Future<bool> autoLogin(String localUserKey) {
    return _$autoLoginAsyncAction.run(() => super.autoLogin(localUserKey));
  }

  late final _$retrieveLoginDataFromLocalStorageAsyncAction = AsyncAction(
      '_LoadingAppViewModelBase.retrieveLoginDataFromLocalStorage',
      context: context);

  @override
  Future<LoginParams?> retrieveLoginDataFromLocalStorage(String userKey) {
    return _$retrieveLoginDataFromLocalStorageAsyncAction
        .run(() => super.retrieveLoginDataFromLocalStorage(userKey));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
