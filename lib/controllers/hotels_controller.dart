import 'package:get/get.dart';
import '../models/hotel.dart';

class HotelsController extends GetxController {
  final _hotels = <Hotel>[].obs;
  final _popularHotels = <Hotel>[].obs;
  final _isLoading = false.obs;

  List<Hotel> get hotels => _hotels;
  List<Hotel> get popularHotels => _popularHotels;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    loadHotels();
  }

  void loadHotels() {
    _isLoading.value = true;
    try {
      final allHotels = [
        Hotel(
          id: '1',
          name: 'Safari Hotel',
          location: 'Mugadisho, Somalia',
          rating: 4.5,
          price: 120.0,
          image: 'assets/images/hotels/safari-hotel.jpg',
          description: 'Experience luxury at its finest with breathtaking ocean views, world-class amenities, and exceptional service. Features include a rooftop restaurant, infinity pool, and spa.',
        ),
        Hotel(
          id: '2',
          name: 'Peace Hotel',
          location: 'Mugadisho, Somalia',
          rating: 4.2,
          price: 85.0,
          image: 'assets/images/hotels/peace-hotel.jpg',
          description: 'Located in the heart of Mogadishu, offering modern comfort with traditional Somali hospitality. Enjoy our premium restaurants, business center, and conference facilities.',
        ),
        Hotel(
          id: '3',
          name: 'Jazeera Palace',
          location: 'Mugadisho, Somalia',
          rating: 4.3,
          price: 95.0,
          image: 'assets/images/hotels/jazeera-palace.jpg',
          description: 'A perfect blend of contemporary luxury and cultural heritage. Features include authentic Somali cuisine, spacious rooms, and a stunning courtyard with traditional architecture.',
        ),
      ];

      _hotels.value = allHotels;
      _popularHotels.value = allHotels.where((hotel) => hotel.rating >= 4.5).toList();
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> bookHotel(String hotelId, DateTime checkIn, DateTime checkOut) async {
    try {
      _isLoading.value = true;
      // Simulate booking process
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar('Success', 'Booking confirmed!');
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Booking failed: $e');
    } finally {
      _isLoading.value = false;
    }
  }
} 