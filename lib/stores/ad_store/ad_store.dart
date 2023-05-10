import 'package:mobx/mobx.dart';

import '../../models/ad.dart';

part 'ad_store.g.dart';

class AdStore = _AdStore with _$AdStore;

abstract class _AdStore with Store {
  _AdStore({required this.ad});
  @observable
  Ad ad;

  @computed
  String get fullName {
    var fName = ad.creator.firstName;
    var lName = ad.creator.lastName;
    var sName = ad.creator.surname;
    return "$lName ${fName[0]}. ${sName[0]}.";
  }
}
