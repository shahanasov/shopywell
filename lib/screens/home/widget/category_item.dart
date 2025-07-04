import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;

  const CategoryItem({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(height: 6),
        Text(name, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
