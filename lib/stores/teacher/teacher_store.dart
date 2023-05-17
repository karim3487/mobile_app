import 'package:mobile_app/models/teacher_list.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../../utils/dio/dio_error_util.dart';
import '../error/error_store.dart';

part 'teacher_store.g.dart';

class TeacherStore = _TeacherStore with _$TeacherStore;

abstract class _TeacherStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _TeacherStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<TeacherList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<TeacherList?> fetchTeachersFuture =
      ObservableFuture<TeacherList?>(emptyPostResponse);

  @observable
  TeacherList? teacherList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchTeachersFuture.status == FutureStatus.pending;

  @action
  Future<void> getTeachers() async {
    final future = _repository.getTeachers();
    fetchTeachersFuture = ObservableFuture(future);

    future.then((teacherList) {
      this.teacherList = teacherList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
