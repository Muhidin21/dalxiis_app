import 'package:get/get.dart';
import '../views/splash_screen.dart';
import '../views/signin_screen.dart';
import '../views/signup_screen.dart';
import '../views/home_screen.dart';
import '../views/onboarding_screen.dart';
import '../views/profile_screen.dart';
import '../views/notifications_screen.dart';
import '../views/popular_places_screen.dart';
import '../views/hotel_details_screen.dart';
import '../views/booking_screen.dart';

abstract class AppPages {
  static const INITIAL = '/splash';
  static const SPLASH = '/splash';
  static const SIGNUP = '/signup';
  static const SIGNIN = '/signin';
  static const HOME = '/home';
  static const ONBOARDING = '/onboarding';
  static const PROFILE = '/profile';
  static const NOTIFICATIONS = '/notifications';
  static const POPULAR_PLACES = '/popular-places';
  static const HOTEL_DETAILS = '/hotel-details';
  static const BOOKING = '/booking';

  static final routes = [
    GetPage(name: SPLASH, page: () => const SplashScreen()),
    GetPage(name: SIGNUP, page: () => const SignUpScreen()),
    GetPage(name: SIGNIN, page: () => const SignInScreen()),
    GetPage(name: HOME, page: () => const HomeScreen()),
    GetPage(name: ONBOARDING, page: () => OnboardingScreen()),
    GetPage(name: PROFILE, page: () => const ProfileScreen()),
    GetPage(name: NOTIFICATIONS, page: () => const NotificationsScreen()),
    GetPage(name: POPULAR_PLACES, page: () => const PopularPlacesScreen()),
    GetPage(
      name: HOTEL_DETAILS,
      page: () => const HotelDetailsScreen(),
    ),
    GetPage(
      name: BOOKING,
      page: () => const BookingScreen(),
    ),
  ];
}
