class WishList {
  final String title;
  final String subtitle;
  final String image;
  final String price;
  final double rating;
  final int reviews;
  int? oldPrice;
  List<String>? sizes;
  WishList({
    this.sizes,
    this.oldPrice,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
  });

}


