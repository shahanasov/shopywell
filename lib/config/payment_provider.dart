//-----------------------------------------------
// providers/payment_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/viewmodels/payment_viewmodel.dart';

final paymentProvider = ChangeNotifierProvider((ref) => PaymentViewModel());