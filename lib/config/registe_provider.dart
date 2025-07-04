import 'package:flutter_riverpod/flutter_riverpod.dart';

final regEmailProvider = StateProvider<String>((ref) => '');
final regPasswordProvider = StateProvider<String>((ref) => '');
final regConfirmPasswordProvider = StateProvider<String>((ref) => '');
final regObscurePasswordProvider = StateProvider<bool>((ref) => true);
final regObscureConfirmProvider = StateProvider<bool>((ref) => true);
