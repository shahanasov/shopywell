import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/data/repositories/app_preference.dart';
import 'package:shopywell/screens/auth/sign_in/sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;

  void completeOnboarding(BuildContext context) async {
    await AppPreferences().setOnboardingSeen();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreen()),
    );
  }

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Choose Products',
      body:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      image: Image.asset(
        'assets/images/fashion shop-rafiki 1.png',
        width: 300,
        height: 250,
      ),
      decoration: customPageDecoration,
    ),

    PageViewModel(
      title: "Make Payment",
      body:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      image: Image.asset(
        'assets/images/Sales consulting-pana 1.png',
        width: 300,
        height: 250,
      ),
      decoration: customPageDecoration,
    ),
    PageViewModel(
      decoration: customPageDecoration,
      title: "Get Your Order",
      body:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      image: Image.asset(
        'assets/images/Shopping bag-rafiki 1.png',
        width: 300,
        height: 250,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IntroductionScreen(
            key: introKey,
            pages: pages.map((page) {
              return PageViewModel(
                title: page.title,
                body: page.body,
                image: page.image,
                decoration: const PageDecoration(
                  bodyAlignment: Alignment.center,
                  imageAlignment: Alignment.center,
                  imageFlex: 2,
                  bodyFlex: 0,
                  titleTextStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                  bodyTextStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                  imagePadding: EdgeInsets.only(top: 170, bottom: 0),
                  titlePadding: EdgeInsets.only(bottom: 8, top: 0),
                  bodyPadding: EdgeInsets.only(bottom: 150),
                  contentMargin: EdgeInsets.symmetric(horizontal: 16),
                ),
              );
            }).toList(),
            onChange: (index) {
              setState(() {
                currentPage = index;
              });
            },
            showSkipButton: false,
            skip: const Text("Prev"),
            next: Text("Next", style: TextStyle(color: AppColors.accentRed)),
            done: Text(
              "Get Started",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.accentRed,
              ),
            ),
            onDone: () {
              completeOnboarding(context);
            },
            dotsDecorator: DotsDecorator(
              activeColor: Colors.red,
              color: Colors.grey.shade400,
              size: const Size.square(8.0),
              activeSize: const Size(16.0, 8.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            globalBackgroundColor: Colors.white,
            controlsPadding: const EdgeInsets.all(16),
            skipOrBackFlex: 0,
            nextFlex: 0,
            showBackButton: true,
            back: Text('Prev', style: TextStyle(color: Colors.grey)),
            showDoneButton: true,
          ),

          // ✅ Custom Skip Button at Top Left
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () => introKey.currentState?.skipToEnd(),
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),

          //  Page count at the top
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              '${currentPage + 1}/${pages.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

final PageDecoration customPageDecoration = const PageDecoration(
  titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
  bodyTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
  contentMargin: EdgeInsets.symmetric(horizontal: 16),
  imagePadding: EdgeInsets.zero, // Remove padding around image
  titlePadding: EdgeInsets.only(top: 4, bottom: 2), // Reduced spacing
  bodyPadding: EdgeInsets.only(bottom: 4), // Reduced spacing
  imageAlignment: Alignment.bottomCenter, // Align image at bottom
  bodyAlignment: Alignment.topCenter, // Align body at top
  imageFlex: 2, // Reduced flex value
  bodyFlex: 1,
);
