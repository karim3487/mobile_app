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

  late final _$timetableAtom =
      Atom(name: '_TimetableStore.timetable', context: context);

  @override
  Timetable? get timetable {
    _$timetableAtom.reportRead();
    return super.timetable;
  }

  @override
  set timetable(Timetable? value) {
    _$timetableAtom.reportWrite(value, super.timetable, () {
      super.timetable = value;
    });
  }

  late final _$focusedDayAtom =
      Atom(name: '_TimetableStore.focusedDay', context: context);

  @override
  DateTime get focusedDay {
    _$focusedDayAtom.reportRead();
    return super.focusedDay;
  }

  @override
  set focusedDay(DateTime value) {
    _$focusedDayAtom.reportWrite(value, super.focusedDay, () {
      super.focusedDay = value;
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

  late final _$groupCodeAtom =
      Atom(name: '_TimetableStore.groupCode', context: context);

  @override
  String get groupCode {
    _$groupCodeAtom.reportRead();
    return super.groupCode;
  }

  @override
  set groupCode(String value) {
    _$groupCodeAtom.reportWrite(value, super.groupCode, () {
      super.groupCode = value;
    });
  }

  late final _$getTimetableListAsyncAction =
      AsyncAction('_TimetableStore.getTimetableList', context: context);

  @override
  Future<void> getTimetableList() {
    return _$getTimetableListAsyncAction.run(() => super.getTimetableList());
  }

  late final _$_TimetableStoreActionController =
      ActionController(name: '_TimetableStore', context: context);

  @override
  Timetable? setTimetableDay() {
    final _$actionInfo = _$_TimetableStoreActionController.startAction(
        name: '_TimetableStore.setTimetableDay');
    try {
      return super.setTimetableDay();
    } finally {
      _$_TimetableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateGroupCode(String groupCode) {
    final _$actionInfo = _$_TimetableStoreActionController.startAction(
        name: '_TimetableStore.updateGroupCode');
    try {
      return super.updateGroupCode(groupCode);
    } finally {
      _$_TimetableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchTimetablesFuture: ${fetchTimetablesFuture},
timetableList: ${timetableList},
timetable: ${timetable},
focusedDay: ${focusedDay},
success: ${success},
groupCode: ${groupCode},
loading: ${loading}
    ''';
  }
}
