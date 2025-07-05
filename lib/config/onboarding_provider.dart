import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/data/repositories/app_preference.dart';


final appPreferencesProvider = Provider<AppPreferences>((ref) {
  return AppPreferences();
});

// AsyncProvider that tells whether onboarding is needed
final isFirstTimeProvider = FutureProvider<bool>((ref) async {
  final prefs = ref.read(appPreferencesProvider);
  return await prefs.isFirstTime();
});
