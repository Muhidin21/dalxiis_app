import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final _isLoggedIn = false.obs;
  final Rx<User?> _user = Rx<User?>(null);
  final _isLoading = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;
  User? get user => _user.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      _isLoggedIn.value = true;
      // Parse user from JSON and set user value
      Get.offAllNamed('/home');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      _isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (email.isNotEmpty && password.isNotEmpty) {
        final user = User(
          id: '1',
          name: 'Test User',
          email: email,
          profileImage: null,
          displayName: email.split('@')[0],
        );
        _user.value = user;
        _isLoggedIn.value = true;
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _isLoggedIn.value = false;
    _user.value = null;
    Get.offAllNamed('/signin');
  }

  void signOut() {
    _user.value = null;
    // Add any other sign out logic (e.g., clear tokens, preferences)
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String? displayName;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.displayName,
  });
}
