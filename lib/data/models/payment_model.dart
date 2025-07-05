class PaymentMethodModel {
  final String brand;
  final String maskedNumber;
  final String logoPath;
  final bool isSelected;

  PaymentMethodModel({
    required this.brand,
    required this.maskedNumber,
    required this.logoPath,
    this.isSelected = false,
  });

  PaymentMethodModel copyWith({bool? isSelected}) {
    return PaymentMethodModel(
      brand: brand,
      maskedNumber: maskedNumber,
      logoPath: logoPath,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}