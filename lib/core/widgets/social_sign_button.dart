import 'package:flutter/material.dart';

Widget socialbuttons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      SocialButton(iconPath: 'assets/logo/google.png'),
      SizedBox(width: 12),
      SocialButton(iconPath: 'assets/logo/apple.png'),
      SizedBox(width: 12),
      SocialButton(iconPath: 'assets/logo/fb.png'),
    ],
  );
}

class SocialButton extends StatelessWidget {
  final String iconPath;

  const SocialButton({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red),
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(iconPath, height: 24),
      ),
    );
  }
}
