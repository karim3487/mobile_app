import 'package:mobile_app/models/ad.dart';

class AdList {
  final List<Ad>? ads;

  AdList({
    this.ads,
  });

  factory AdList.fromJson(List<dynamic> json) {
    List<Ad> ads = <Ad>[];
    ads = json.map((ad) => Ad.fromJson(ad)).toList();

    return AdList(
      ads: ads,
    );
  }
}
