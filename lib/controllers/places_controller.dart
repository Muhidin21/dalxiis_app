import 'package:get/get.dart';

class PlacesController extends GetxController {
  final places = <Place>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with sample data
    places.assignAll([
      Place(
        name: 'Mogadishu',
        image: 'assets/images/locations/mogadishu.jpg',
        hotelCount: 125,
        rating: 4.5,
      ),
      Place(
        name: 'Hargeisa',
        image: 'assets/images/locations/hargeisa.jpg',
        hotelCount: 85,
        rating: 4.3,
      ),
      Place(
        name: 'Kismayo',
        image: 'assets/images/locations/kismayo.jpg',
        hotelCount: 45,
        rating: 4.2,
      ),
      Place(
        name: 'Bosaso',
        image: 'assets/images/locations/bosaso.jpg',
        hotelCount: 62,
        rating: 4.4,
      ),
    ]);
  }

  void toggleFavorite(int index) {
    final place = places[index];
    place.isFavorite = !place.isFavorite;
    places[index] = place;
  }
}

class Place {
  final String name;
  final String image;
  final int hotelCount;
  final double rating;
  bool isFavorite;

  Place({
    required this.name,
    required this.image,
    required this.hotelCount,
    required this.rating,
    this.isFavorite = false,
  });
} 