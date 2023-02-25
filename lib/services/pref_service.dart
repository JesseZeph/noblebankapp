import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static final String onboarding = 'onboardingKey';


  Future<void> setOnboarding() async {
    final SharedPreferences pref = await _prefs;
    await pref.setBool(onboarding, true);
  }

}
final prefServiceProvider = Provider<PrefService>((ref) {
  return PrefService();
});