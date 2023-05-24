import 'dart:developer';

import 'package:mobile_app/models/timetable_list.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import '../../data/repository.dart';
import '../../models/timetable.dart';
import '../../utils/dio/dio_error_util.dart';
import '../error/error_store.dart';

part 'timetable_store.g.dart';

class TimetableStore = _TimetableStore with _$TimetableStore;

abstract class _TimetableStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _TimetableStore(Repository repository) : _repository = repository {
    // setting up disposers
    _setupDisposers();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => focusedDay, (_) => setTimetableDay()),
    ];
  }

  // store variables:-----------------------------------------------------------
  static ObservableFuture<TimetableList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<TimetableList?> fetchTimetablesFuture =
      ObservableFuture<TimetableList?>(emptyPostResponse);

  @observable
  TimetableList? timetableList;

  @observable
  Timetable? timetable;

  @observable
  DateTime focusedDay = DateTime.now();

  @observable
  bool success = false;

  @observable
  String groupCode = 'И508Б';

  @computed
  bool get loading => fetchTimetablesFuture.status == FutureStatus.pending;

  @action
  Future<void> getTimetableList() async {
    final day = DateFormat('yyyy-MM-dd').format(focusedDay);
    final future = _repository.getTimetable(groupCode, day);
    fetchTimetablesFuture = ObservableFuture(future);

    future.then((timetableList) {
      this.timetableList = timetableList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Timetable? setTimetableDay() {
    int weekDay = focusedDay.weekday - 1;
    try {
      timetable = timetableList?[weekDay];
    } catch (e) {
      timetable = null;
    }
  }

  @action
  void updateGroupCode(String groupCode) {
    this.groupCode = groupCode;
  }
}
