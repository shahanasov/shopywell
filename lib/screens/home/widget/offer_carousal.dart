import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopywell/config/carousal_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

class OfferCarousel extends ConsumerWidget {
  const OfferCarousel({super.key});

  static Widget buildBanner({
    required String imagePath,
    required Color bgColor,
    required String discountText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      discountText,
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColors.primaryWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Now in (product)\nAll colours",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primaryWhite),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Shop Now",
                            style: TextStyle(color: AppColors.primaryWhite),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.primaryWhite,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(carouselIndexProvider);

    final List<Widget> banners = [
      buildBanner(
        imagePath: 'assets/images/womanwithshoppingbag.jpg',
        bgColor: Colors.pinkAccent,
        discountText: '50-40% OFF',
      ),
      buildBanner(
        imagePath: 'assets/images/womanwithshoppingbag.jpg',
        bgColor: Colors.deepPurpleAccent,
        discountText: 'Buy 1 Get 1',
      ),
      buildBanner(
        imagePath: 'assets/images/womanwithshoppingbag.jpg',
        bgColor: Colors.teal,
        discountText: '50-40% OFF',
      ),
    ];

    return Column(
      children: [
        CarouselSlider(
          items: banners,
          options: CarouselOptions(
            height: 230,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              ref.read(carouselIndexProvider.notifier).state = index;
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            final isActive = index == currentIndex;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 10 : 8,
              height: isActive ? 10 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.pinkAccent : Colors.grey[300],
              ),
            );
          }),
        ),
      ],
    );
  }
}
