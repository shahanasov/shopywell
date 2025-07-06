import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/config/registe_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/core/widgets/custom_text_field.dart';
import 'package:shopywell/core/widgets/social_sign_button.dart';
import 'package:shopywell/data/repositories/auth_services.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(regObscurePasswordProvider);
    final obscureConfirm = ref.watch(regObscureConfirmProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Text(
                "Create an\naccount",
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
                    ref.read(regEmailProvider.notifier).state = val,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                icon: Icons.lock,
                hint: "Password",
                isPassword: true,
                obscureText: obscurePassword,
                onVisibilityToggle: () {
                  ref.read(regObscurePasswordProvider.notifier).state =
                      !obscurePassword;
                },
                onChanged: (val) =>
                    ref.read(regPasswordProvider.notifier).state = val,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                icon: Icons.lock,
                hint: "ConfirmPassword",
                isPassword: true,
                obscureText: obscureConfirm,
                onVisibilityToggle: () {
                  ref.read(regObscureConfirmProvider.notifier).state =
                      !obscureConfirm;
                },
                onChanged: (val) =>
                    ref.read(regConfirmPasswordProvider.notifier).state = val,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text.rich(
                  TextSpan(
                    text: 'By clicking the ',
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const TextSpan(
                        text: ' button, you agree to the public offer',
                      ),
                    ],
                  ),
                  style: GoogleFonts.montserrat(fontSize: 12),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  final email = ref.read(regEmailProvider);
                  final password = ref.read(regPasswordProvider);
                  final confirm = ref.read(regConfirmPasswordProvider);

                  ref
                      .read(signUpProvider)
                      .signUp(
                        context: context,
                        email: email,
                        password: password,
                        confirmPassword: confirm,
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text("Create Account", style: GoogleFonts.montserrat()),
              ),
              const SizedBox(height: 40),
              const Center(child: Text("- OR Continue with -")),
              const SizedBox(height: 20),
              SocialButtonsRow (),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I Already Have an Account "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
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
    );
  }
}
