import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/config/login_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/core/widgets/custom_text_field.dart';
import 'package:shopywell/core/widgets/social_sign_button.dart';
import 'package:shopywell/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:shopywell/screens/auth/sign_up/sign_up_screen.dart';
import 'package:shopywell/screens/onboarding/get_started_screen.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = ref.watch(obscurePasswordProvider);
    final formKey = GlobalKey<FormState>();


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Welcome\nBack!",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  
                  icon: Icons.person,
                  hint: "Username or Email",
                  onChanged: (val) =>
                      ref.read(emailProvider.notifier).state = val,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  icon: Icons.lock,
                  hint: "Password",
                  isPassword: true,
                  obscureText: obscurePassword,
                  onVisibilityToggle: () {
                    ref.read(obscurePasswordProvider.notifier).state =
                        !obscurePassword;
                  },
                  onChanged: (val) =>
                      ref.read(passwordProvider.notifier).state = val,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: AppColors.accentRed),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final email = ref.read(emailProvider);
                    final password = ref.read(passwordProvider);
                    print("Login: $email - $password");
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GetStartedScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentRed,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:  Text("Login", style: GoogleFonts.montserrat()),
                ),
                const SizedBox(height: 20),
                const Center(child: Text("- OR Continue with -")),
                const SizedBox(height: 20),
                socialbuttons(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Create An Account "),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.accentRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
