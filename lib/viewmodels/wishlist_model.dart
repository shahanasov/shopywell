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

    factory WishList.sample() {
    return WishList(
      title: 'Nike Sneakers',
      subtitle: 'Vision Alta Men\'s Shoes Size (All Colours)',
      rating: 4.5,
      reviews: 56890,
      price: '1500',
      image: '',
      oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
    );
  }
}


final List<WishList> products = [
  WishList(
    title: 'Black Winter...',
    subtitle: 'Autumn And Winter Casual cotton-padded jacket...',
    image: 'assets/images/women.jpg',
    price: '₹499',
    rating: 4.5,
    reviews: 6890,oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
  ),
  WishList(
    title: 'Mens Starry',
    subtitle: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
    image: 'assets/images/women.jpg',
    price: '₹399',
    rating: 4.3,
    reviews: 152344,
    oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
  ),
  // Add more...

    WishList(
    title: 'Mens Starry',
    subtitle: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
    image: 'assets/images/women.jpg',
    price: '₹399',
    rating: 4.3,
    reviews: 152344,
    oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
  ),
    WishList(
    title: 'Mens Starry',
    subtitle: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
    image: 'assets/images/women.jpg',
    price: '₹399',
    rating: 4.3,
    reviews: 152344,
    oldPrice: 2999,
      sizes: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'],
  ),
  
];
