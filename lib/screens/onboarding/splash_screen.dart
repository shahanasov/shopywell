import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/login_provider.dart';
import 'package:shopywell/config/onboarding_provider.dart';
import 'package:shopywell/screens/auth/sign_in/sign_in_screen.dart';
import 'package:shopywell/screens/onboarding/onboarding_screen.dart';
import 'package:shopywell/screens/onboarding/get_started_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _showLoader = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showLoader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showLoader) {
      return const Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('assets/logo/shopywelllogo.png'),
            width: 202,
            height: 66,
          ),
        ),
      );
    }

    final onboardingStatus = ref.watch(isFirstTimeProvider);

    return onboardingStatus.when(
      loading: () => const Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('assets/logo/shopywelllogo.png'),
            width: 202,
            height: 66,
          ),
        ),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text("Error: $e")),
      ),
      data: (isFirstTime) {
        if (isFirstTime) {
          return const OnboardingScreen();
        }

        final authState = ref.watch(authStateProvider);
        return authState.when(
          loading: () => const  Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('assets/logo/shopywelllogo.png'),
            width: 202,
            height: 66,
          ),
        ),
      ),
          error: (e, _) => Scaffold(
            body: Center(child: Text("Error: $e")),
          ),
          data: (user) {
            if (user != null) {
              return const GetStartedScreen();
            } else {
              return const SignInScreen();
            }
          },
        );
      },
    );
  }
}
