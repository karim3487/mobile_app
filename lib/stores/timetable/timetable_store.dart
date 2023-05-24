import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:mobile_app/models/timetable_list.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import '../../data/repository.dart';
import '../../models/group_list.dart';
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
  static ObservableFuture<TimetableList?> emptyGetTimetableResponse =
      ObservableFuture.value(null);

  static ObservableFuture<GroupList?> emptyGetGroupsResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<TimetableList?> fetchTimetablesFuture =
      ObservableFuture<TimetableList?>(emptyGetTimetableResponse);

  @observable
  ObservableFuture<GroupList?> fetchGroupsFuture =
      ObservableFuture<GroupList?>(emptyGetGroupsResponse);

  @observable
  TimetableList? timetableList;

  @observable
  GroupList? groupList;

  @observable
  String filter = '';

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

  @computed
  List<DropDownValueModel> get groupCodes {
    if (groupList != null) {
      return groupList!.codeList
          .map((value) => DropDownValueModel(name: value, value: value))
          .toList();
    } else {
      return [const DropDownValueModel(name: "Загрузка...", value: "")];
    }
  }

  @action
  Future<void> getTimetableList() async {
    final day = DateFormat('yyyy-MM-dd').format(focusedDay);
    final future = _repository.getTimetable(groupCode, day);
    fetchTimetablesFuture = ObservableFuture(future);

    future.then((timetableList) {
      this.timetableList = timetableList;
      setTimetableDay();
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future<void> getGroups() async {
    final future = _repository.getGroups();
    fetchGroupsFuture = ObservableFuture(future);

    future.then((groupList) {
      this.groupList = groupList;
      print("OK");
    }).catchError((error) {
      print("ERROR!!!!");
      print(error);
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

  @action
  void setFilter(String value) {
    filter = value;
  }
}
