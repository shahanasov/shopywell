import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/data/models/wishlist_model.dart';

/// Product List Provider (Static Dummy Data)
final productListProvider = Provider<List<WishList>>((ref) {
  return [
    WishList(
      title: 'Black Winter...',
      subtitle: 'Autumn And Winter Casual cotton-padded jacket...',
      image: 'assets/images/blcakwinter.png',
      price: '₹499',
      rating: 4.5,
      reviews: 6890,
      oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
    ),
    WishList(
      title: 'Mens Starry',
      subtitle: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      image: 'assets/images/starry.png',
      price: '₹399',
      rating: 4.3,
      reviews: 152344,
      oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
    ),
    WishList(
      title: 'Black Dress',
      subtitle: 'Black Dress Sky Printed Shirt 100% Cotton Fabric',
      image: 'assets/images/blackdress.png',
      price: '₹399',
      rating: 4.3,
      reviews: 152344,
      oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
    ),
    WishList(
      title: 'Pink Embroide...',
      subtitle: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      image: 'assets/images/pinklady.png',
      price: '₹399',
      rating: 4.3,
      reviews: 152344,
      oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
    ),
  ];
});

/// Selected Size Provider
final selectedSizeProvider = StateProvider<String>((ref) => '7 UK');

