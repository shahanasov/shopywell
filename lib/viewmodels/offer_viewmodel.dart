
import 'package:flutter_riverpod/flutter_riverpod.dart';

final offerProvider = Provider((ref) => OfferViewModel());

class OfferViewModel {
  List<String> get offers => [
        'assets/shoe1.png',
        'assets/shoe2.png',
        'assets/shoe3.png',
      ];
}


// features/home/viewmodels/banner_viewmodel.dart

final bannerProvider = Provider((ref) => BannerViewModel());

class BannerViewModel {
  String get title => 'New Arrivals';
  String get subtitle => "Summer' 25 Collections";
  String get buttonText => 'View all';
}