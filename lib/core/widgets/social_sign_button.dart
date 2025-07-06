import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/data/repositories/auth_services.dart';

class SocialButtonsRow extends ConsumerWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpService = ref.read(signUpProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          iconPath: 'assets/logo/google.png',
          onTap: () => signUpService.signInWithGoogle(context),
        ),
        const SizedBox(width: 12),
        SocialButton(iconPath: 'assets/logo/apple.png'),
        const SizedBox(width: 12),
        SocialButton(iconPath: 'assets/logo/fb.png',
         onTap: () => signUpService.signInWithFacebook(context),
        ),
      ],
    );
  }
}


class SocialButton extends StatelessWidget {
  final String iconPath;
  VoidCallback? onTap;
   SocialButton({super.key, required this.iconPath,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
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
      ),
    );
  }
}
