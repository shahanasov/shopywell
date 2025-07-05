//-----------------------------------------------
// viewmodels/payment_viewmodel.dart

import 'package:flutter/material.dart';
import 'package:shopywell/data/models/payment_model.dart';

class PaymentViewModel extends ChangeNotifier {
  final List<PaymentMethodModel> _methods = [
    PaymentMethodModel(
      brand: 'Stripe',
      maskedNumber: '********2109',
      logoPath: 'assets/images/stripe.png',
      isSelected: true,
    ),
    PaymentMethodModel(
      brand: 'Apple',
      maskedNumber: '********2109',
      logoPath: 'assets/images/apple.png',
    ),
  ];

  List<PaymentMethodModel> get methods => _methods;

  void selectMethod(int index) {
    for (int i = 0; i < _methods.length; i++) {
      _methods[i] = _methods[i].copyWith(isSelected: i == index);
    }
    notifyListeners();
  }
}