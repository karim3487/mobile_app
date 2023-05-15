import 'package:mobile_app/models/file_list.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../../utils/dio/dio_error_util.dart';
import '../error/error_store.dart';

part 'file_store.g.dart';

class FileStore = _FileStore with _$FileStore;

abstract class _FileStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _FileStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<FileList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<FileList?> fetchFilesFuture =
      ObservableFuture<FileList?>(emptyPostResponse);

  @observable
  FileList? fileList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchFilesFuture.status == FutureStatus.pending;

  @action
  Future<void> getFiles() async {
    final future = _repository.getFiles();
    fetchFilesFuture = ObservableFuture(future);

    future.then((fileList) {
      this.fileList = fileList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
