import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_app_bar.dart';
import '../routes/app_pages.dart';

class PopularPlacesScreen extends StatelessWidget {
  const PopularPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = [
      {
        'name': 'Dolphin Hotel',
        'location': 'Mogadishu, Banadir',
        'rating': 4.7,
        'price': 459,
        'image': 'assets/images/hotels/safari-hotel.jpg',
      },
      {
        'name': 'Five star Hotel',
        'location': 'Mogadishu, Bakaro',
        'rating': 4.5,
        'price': 565,
        'image': 'assets/images/hotels/peace-hotel.jpg',
      },
      {
        'name': 'Safari Hotel',
        'location': 'Bosaso, Bari',
        'rating': 4.3,
        'price': 781,
        'image': 'assets/images/hotels/jazeera-palace.jpg',
      },
      {
        'name': 'Ranguuli Resort',
        'location': 'Saylac, Airport Road',
        'rating': 4.6,
        'price': 457,
        'image': 'assets/images/hotels/safari-hotel.jpg',
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Popular Places',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return GestureDetector(
            onTap: () => Get.toNamed(
              AppPages.HOTEL_DETAILS,
              arguments: {
                'name': hotel['name'],
                'location': hotel['location'],
                'rating': hotel['rating'],
                'price': hotel['price'],
                'image': hotel['image'],
                'description': 'You will get a complete travel package on the beaches. '
                    'Packages in the form of airline tickets, recommended '
                    'Hotel rooms, Transportation, Have you ever been on '
                    'holiday to the Greek ETC...',
              },
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          hotel['image'] as String,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              hotel['name'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${hotel['price']}/Person',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Text(
                              hotel['location'] as String,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const Spacer(),
                            Icon(Icons.star, size: 16, color: Colors.amber.shade700),
                            const SizedBox(width: 4),
                            Text(
                              '${hotel['rating']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
