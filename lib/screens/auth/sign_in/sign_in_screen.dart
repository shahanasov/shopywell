import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/config/login_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/core/widgets/custom_text_field.dart';
import 'package:shopywell/core/widgets/social_sign_button.dart';
import 'package:shopywell/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:shopywell/screens/auth/sign_up/sign_up_screen.dart';
import 'package:shopywell/screens/onboarding/get_started_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> _signInWithEmailAndPassword() async {
    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);

    if (!formKey.currentState!.validate()) return;

    try {
      setState(() => isLoading = true);

      // 🔐 Firebase login
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ Success - navigate to GetStartedScreen
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => GetStartedScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String error = "An error occurred";
      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided.';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(obscurePasswordProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Welcome\nBack!",
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isLoading ? null : _signInWithEmailAndPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentRed,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text("Login", style: GoogleFonts.montserrat()),
                ),
                const SizedBox(height: 60),
                const Center(child: Text("- OR Continue with -")),
                const SizedBox(height: 20),
                SocialButtonsRow(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Create An Account "),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.accentRed,
                          decorationThickness: 2,
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
