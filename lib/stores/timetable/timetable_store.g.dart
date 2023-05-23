// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimetableStore on _TimetableStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_TimetableStore.loading'))
      .value;

  late final _$fetchTimetablesFutureAtom =
      Atom(name: '_TimetableStore.fetchTimetablesFuture', context: context);

  @override
  ObservableFuture<TimetableList?> get fetchTimetablesFuture {
    _$fetchTimetablesFutureAtom.reportRead();
    return super.fetchTimetablesFuture;
  }

  @override
  set fetchTimetablesFuture(ObservableFuture<TimetableList?> value) {
    _$fetchTimetablesFutureAtom.reportWrite(value, super.fetchTimetablesFuture,
        () {
      super.fetchTimetablesFuture = value;
    });
  }

  late final _$timetableListAtom =
      Atom(name: '_TimetableStore.timetableList', context: context);

  @override
  TimetableList? get timetableList {
    _$timetableListAtom.reportRead();
    return super.timetableList;
  }

  @override
  set timetableList(TimetableList? value) {
    _$timetableListAtom.reportWrite(value, super.timetableList, () {
      super.timetableList = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_TimetableStore.success', context: context);

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

  late final _$getTimetablesAsyncAction =
      AsyncAction('_TimetableStore.getTimetables', context: context);

  @override
  Future<void> getTimetables(String groupCode) {
    return _$getTimetablesAsyncAction.run(() => super.getTimetables(groupCode));
  }

  @override
  String toString() {
    return '''
fetchTimetablesFuture: ${fetchTimetablesFuture},
timetableList: ${timetableList},
success: ${success},
loading: ${loading}
    ''';
  }
}
