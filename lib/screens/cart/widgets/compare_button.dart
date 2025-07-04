import 'package:flutter/material.dart';

class CompareButtons extends StatelessWidget {
  const CompareButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _RoundedIconButton(
            icon: Icons.remove_red_eye_outlined,
            label: 'View Similar',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _RoundedIconButton(
            icon: Icons.style_outlined,
            label: 'Add to Compare',
          ),
        ),
      ],
    );
  }
}

class _RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _RoundedIconButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
