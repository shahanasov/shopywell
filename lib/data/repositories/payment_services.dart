import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:shopywell/core/constants/keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentSuccessProvider = StateProvider<bool>((ref) => false);


class PaymentServices {
  PaymentServices._();

  static final PaymentServices instance = PaymentServices._();

  Future<void> makePayment(int amount, String currency, WidgetRef ref, BuildContext context) async {
    try {
      String? result = await createPaymentIntent(amount, currency);
      if (result == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: result,
          merchantDisplayName: "Akash Maroli",
        ),
      );
      await processPayment();

        // ✅ Trigger alert dialog
    ref.read(paymentSuccessProvider.notifier).state = true;

    } catch (e) {
      print(e);
    }
  }

  Future<void> processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      (e);
    }
  }

  Future<String?> createPaymentIntent(int amount, String currency) async {
    try {
      Map<String, dynamic> data = {"amount": amount.toString(), "currency": currency};
      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: data,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['client_secret'];
      } else {
        print("Failed to create payment intent: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error creating payment intent: $e");
      return null;
    }
  }
}
