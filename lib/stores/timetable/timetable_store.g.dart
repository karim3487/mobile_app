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
  Computed<List<DropDownValueModel>>? _$groupCodesComputed;

  @override
  List<DropDownValueModel> get groupCodes => (_$groupCodesComputed ??=
          Computed<List<DropDownValueModel>>(() => super.groupCodes,
              name: '_TimetableStore.groupCodes'))
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

  late final _$fetchGroupsFutureAtom =
      Atom(name: '_TimetableStore.fetchGroupsFuture', context: context);

  @override
  ObservableFuture<GroupList?> get fetchGroupsFuture {
    _$fetchGroupsFutureAtom.reportRead();
    return super.fetchGroupsFuture;
  }

  @override
  set fetchGroupsFuture(ObservableFuture<GroupList?> value) {
    _$fetchGroupsFutureAtom.reportWrite(value, super.fetchGroupsFuture, () {
      super.fetchGroupsFuture = value;
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

  late final _$groupListAtom =
      Atom(name: '_TimetableStore.groupList', context: context);

  @override
  GroupList? get groupList {
    _$groupListAtom.reportRead();
    return super.groupList;
  }

  @override
  set groupList(GroupList? value) {
    _$groupListAtom.reportWrite(value, super.groupList, () {
      super.groupList = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_TimetableStore.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
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

  late final _$getGroupsAsyncAction =
      AsyncAction('_TimetableStore.getGroups', context: context);

  @override
  Future<void> getGroups() {
    return _$getGroupsAsyncAction.run(() => super.getGroups());
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
  void setFilter(String value) {
    final _$actionInfo = _$_TimetableStoreActionController.startAction(
        name: '_TimetableStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_TimetableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchTimetablesFuture: ${fetchTimetablesFuture},
fetchGroupsFuture: ${fetchGroupsFuture},
timetableList: ${timetableList},
groupList: ${groupList},
filter: ${filter},
timetable: ${timetable},
focusedDay: ${focusedDay},
success: ${success},
groupCode: ${groupCode},
loading: ${loading},
groupCodes: ${groupCodes}
    ''';
  }
}
