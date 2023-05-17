// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeacherStore on _TeacherStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_TeacherStore.loading'))
      .value;

  late final _$fetchTeachersFutureAtom =
      Atom(name: '_TeacherStore.fetchTeachersFuture', context: context);

  @override
  ObservableFuture<TeacherList?> get fetchTeachersFuture {
    _$fetchTeachersFutureAtom.reportRead();
    return super.fetchTeachersFuture;
  }

  @override
  set fetchTeachersFuture(ObservableFuture<TeacherList?> value) {
    _$fetchTeachersFutureAtom.reportWrite(value, super.fetchTeachersFuture, () {
      super.fetchTeachersFuture = value;
    });
  }

  late final _$teacherListAtom =
      Atom(name: '_TeacherStore.teacherList', context: context);

  @override
  TeacherList? get teacherList {
    _$teacherListAtom.reportRead();
    return super.teacherList;
  }

  @override
  set teacherList(TeacherList? value) {
    _$teacherListAtom.reportWrite(value, super.teacherList, () {
      super.teacherList = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_TeacherStore.success', context: context);

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

  late final _$getTeachersAsyncAction =
      AsyncAction('_TeacherStore.getTeachers', context: context);

  @override
  Future<void> getTeachers() {
    return _$getTeachersAsyncAction.run(() => super.getTeachers());
  }

  @override
  String toString() {
    return '''
fetchTeachersFuture: ${fetchTeachersFuture},
teacherList: ${teacherList},
success: ${success},
loading: ${loading}
    ''';
  }
}
