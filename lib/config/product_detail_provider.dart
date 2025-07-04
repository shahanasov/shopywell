// viewmodels/product_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/viewmodels/wishlist_model.dart';

final productProvider = Provider<WishList>((ref) => WishList.sample());
final selectedSizeProvider = StateProvider<String>((ref) => '7 UK');