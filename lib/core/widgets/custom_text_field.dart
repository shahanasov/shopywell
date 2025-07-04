import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool isPassword;
  final bool obscureText;
  // final String text;
  final VoidCallback? onVisibilityToggle;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hint,
    // required this.text,
    this.isPassword = false,
    this.obscureText = false,
    this.onVisibilityToggle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword && obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: onVisibilityToggle,
              )
            : null,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
