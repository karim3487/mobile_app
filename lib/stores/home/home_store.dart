import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../../models/ad_list.dart';
import '../../utils/dio/dio_error_util.dart';
import '../error/error_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _HomeStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<AdList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<AdList?> fetchAdsFuture =
      ObservableFuture<AdList?>(emptyPostResponse);

  @observable
  AdList? adsList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchAdsFuture.status == FutureStatus.pending;

  @action
  Future<void> getAds() async {
    final future = _repository.getAds();
    fetchAdsFuture = ObservableFuture(future);

    future.then((adsList) {
      this.adsList = adsList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
