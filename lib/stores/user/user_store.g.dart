// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$fetchAdsFutureAtom =
      Atom(name: '_UserStore.fetchAdsFuture', context: context);

  @override
  ObservableFuture<User?> get fetchAdsFuture {
    _$fetchAdsFutureAtom.reportRead();
    return super.fetchAdsFuture;
  }

  @override
  set fetchAdsFuture(ObservableFuture<User?> value) {
    _$fetchAdsFutureAtom.reportWrite(value, super.fetchAdsFuture, () {
      super.fetchAdsFuture = value;
    });
  }

  late final _$userAtom = Atom(name: '_UserStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_UserStore.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    return '''
fetchAdsFuture: ${fetchAdsFuture},
user: ${user}
    ''';
  }
}
