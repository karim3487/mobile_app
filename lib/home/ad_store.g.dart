// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdStore on _AdStore, Store {
  Computed<String>? _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??=
          Computed<String>(() => super.fullName, name: '_AdStore.fullName'))
      .value;

  late final _$adAtom = Atom(name: '_AdStore.ad', context: context);

  @override
  Ad get ad {
    _$adAtom.reportRead();
    return super.ad;
  }

  @override
  set ad(Ad value) {
    _$adAtom.reportWrite(value, super.ad, () {
      super.ad = value;
    });
  }

  @override
  String toString() {
    return '''
ad: ${ad},
fullName: ${fullName}
    ''';
  }
}
