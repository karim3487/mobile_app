import 'package:flutter/material.dart';
import 'package:mobile_app/data/repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final Repository _repository;

  _UserStore(Repository repository) : _repository = repository;

  static ObservableFuture<User?> emptyUser = ObservableFuture.value(null);

  @observable
  ObservableFuture<User?> fetchAdsFuture = ObservableFuture<User?>(emptyUser);

  @observable
  User? user;

  @action
  Future<void> getUser() async {
    final future = _repository.getUser();
    fetchAdsFuture = ObservableFuture(future);

    future.then((user) {
      this.user = user;
    }).catchError((error) {
      print(error);
    });
  }
}
