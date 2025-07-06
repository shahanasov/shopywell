import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/config/forgot_password_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/core/widgets/custom_text_field.dart';
import 'package:shopywell/data/repositories/auth_services.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              Text(
                "Forgot\npassword?",
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                icon: Icons.email,
                hint: "Enter your email address",
                onChanged: (val) =>
                    ref.read(forgotEmailProvider.notifier).state = val,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Text('* ',style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: AppColors.accentRed,
                      ),),
                  ),
                  Text(
                    "We will send you a message to set or reset\n your new password",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final email = ref.read(forgotEmailProvider);
                  ref
                      .read(signUpProvider)
                      .forgotPassword(context: context, email: email);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentRed,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
