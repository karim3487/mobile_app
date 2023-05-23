import 'package:mobile_app/models/timetable_list.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
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
  _TimetableStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<TimetableList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<TimetableList?> fetchTimetablesFuture =
      ObservableFuture<TimetableList?>(emptyPostResponse);

  @observable
  TimetableList? timetableList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchTimetablesFuture.status == FutureStatus.pending;

  @action
  Future<void> getTimetables(String groupCode) async {
    final future = _repository.getTimetable(groupCode);
    fetchTimetablesFuture = ObservableFuture(future);

    future.then((timetableList) {
      this.timetableList = timetableList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
