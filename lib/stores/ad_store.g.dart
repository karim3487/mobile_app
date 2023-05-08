// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdStore on _AdStore, Store {
  late final _$adsAtom = Atom(name: '_AdStore.ads', context: context);

  @override
  List<Ad> get ads {
    _$adsAtom.reportRead();
    return super.ads;
  }

  @override
  set ads(List<Ad> value) {
    _$adsAtom.reportWrite(value, super.ads, () {
      super.ads = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AdStore.isLoading', context: context);

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

  late final _$getAdsAsyncAction =
      AsyncAction('_AdStore.getAds', context: context);

  @override
  Future<dynamic> getAds() {
    return _$getAdsAsyncAction.run(() => super.getAds());
  }

  @override
  String toString() {
    return '''
ads: ${ads},
isLoading: ${isLoading}
    ''';
  }
}
