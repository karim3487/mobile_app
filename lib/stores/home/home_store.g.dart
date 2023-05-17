// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_HomeStore.loading'))
      .value;

  late final _$fetchAdsFutureAtom =
      Atom(name: '_HomeStore.fetchAdsFuture', context: context);

  @override
  ObservableFuture<AdList?> get fetchAdsFuture {
    _$fetchAdsFutureAtom.reportRead();
    return super.fetchAdsFuture;
  }

  @override
  set fetchAdsFuture(ObservableFuture<AdList?> value) {
    _$fetchAdsFutureAtom.reportWrite(value, super.fetchAdsFuture, () {
      super.fetchAdsFuture = value;
    });
  }

  late final _$adsListAtom = Atom(name: '_HomeStore.adsList', context: context);

  @override
  AdList? get adsList {
    _$adsListAtom.reportRead();
    return super.adsList;
  }

  @override
  set adsList(AdList? value) {
    _$adsListAtom.reportWrite(value, super.adsList, () {
      super.adsList = value;
    });
  }

  late final _$successAtom = Atom(name: '_HomeStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$getAdsAsyncAction =
      AsyncAction('_HomeStore.getAds', context: context);

  @override
  Future<void> getAds() {
    return _$getAdsAsyncAction.run(() => super.getAds());
  }

  @override
  String toString() {
    return '''
fetchAdsFuture: ${fetchAdsFuture},
adsList: ${adsList},
success: ${success},
loading: ${loading}
    ''';
  }
}
