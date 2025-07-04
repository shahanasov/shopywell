// ui/widgets/size_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/product_detail_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

class SizeSelector extends ConsumerWidget {
  const SizeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    final selectedSize = ref.watch(selectedSizeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size: $selectedSize',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: product.sizes!.map((size) {
              final isSelected = selectedSize == size;
              return ChoiceChip(
                disabledColor: AppColors.primaryWhite,

                label: Text(
                  size,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? AppColors.primaryWhite
                        : AppColors.accentPink,
                  ),
                ),
                side: const BorderSide(color: AppColors.accentPink, width: 2),
                selected: isSelected,
                showCheckmark: false,
                visualDensity: const VisualDensity(
                  horizontal: -2,
                  vertical: -3,
                ), // Reduce chip size
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),

                selectedColor: AppColors.accentPink,
                onSelected: (_) =>
                    ref.read(selectedSizeProvider.notifier).state = size,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
