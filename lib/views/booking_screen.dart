import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_app_bar.dart';
import '../models/hotel.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Selected dates for booking
  DateTime? checkInDate;
  DateTime? checkOutDate;
  
  // Number of guests
  int adults = 1;
  int children = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Book Your Stay',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Summary Card
            _buildHotelSummary(),
            const SizedBox(height: 24),

            // Dates Selection
            _buildDateSelection(),
            const SizedBox(height: 24),

            // Guests Selection
            _buildGuestsSelection(),
            const SizedBox(height: 24),

            // Price Summary
            _buildPriceSummary(),
            const SizedBox(height: 32),

            // Book Now Button
            _buildBookButton(),
          ],
        ),
      ),
    );
  }

  // Build hotel summary section
  Widget _buildHotelSummary() {
    final hotel = Get.arguments as Hotel;
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          // Hotel Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              hotel.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Hotel Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        hotel.location,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${hotel.price}/night',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build date selection section
  Widget _buildDateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Dates',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            // Check-in Date
            Expanded(
              child: _buildDateField(
                label: 'Check-in',
                date: checkInDate,
                onTap: () => _selectDate(isCheckIn: true),
              ),
            ),
            const SizedBox(width: 16),
            // Check-out Date
            Expanded(
              child: _buildDateField(
                label: 'Check-out',
                date: checkOutDate,
                onTap: () => _selectDate(isCheckIn: false),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Build date field widget
  Widget _buildDateField({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date == null
                  ? 'Select date'
                  : '${date.day}/${date.month}/${date.year}',
              style: TextStyle(
                color: date == null ? Colors.grey : Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build guests selection section
  Widget _buildGuestsSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Guests',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        // Adults Counter
        _buildGuestCounter(
          label: 'Adults',
          count: adults,
          onIncrement: () => setState(() => adults++),
          onDecrement: () {
            if (adults > 1) setState(() => adults--);
          },
        ),
        const SizedBox(height: 12),
        // Children Counter
        _buildGuestCounter(
          label: 'Children',
          count: children,
          onIncrement: () => setState(() => children++),
          onDecrement: () {
            if (children > 0) setState(() => children--);
          },
        ),
      ],
    );
  }

  // Build guest counter widget
  Widget _buildGuestCounter({
    required String label,
    required int count,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            _buildCounterButton(
              icon: Icons.remove,
              onTap: onDecrement,
            ),
            const SizedBox(width: 16),
            Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            _buildCounterButton(
              icon: Icons.add,
              onTap: onIncrement,
            ),
          ],
        ),
      ],
    );
  }

  // Build counter button widget
  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }

  // Build price summary section
  Widget _buildPriceSummary() {
    final hotel = Get.arguments as Hotel;
    final nights = checkOutDate != null && checkInDate != null
        ? checkOutDate!.difference(checkInDate!).inDays
        : 0;
    final totalPrice = hotel.price * nights;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPriceRow('Price per night', '\$${hotel.price}'),
          const SizedBox(height: 8),
          _buildPriceRow('Number of nights', nights.toString()),
          const Divider(height: 24),
          _buildPriceRow(
            'Total',
            '\$${totalPrice.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  // Build price row widget
  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.primary : null,
          ),
        ),
      ],
    );
  }

  // Build book button
  Widget _buildBookButton() {
    return ElevatedButton(
      onPressed: _handleBooking,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Confirm Booking',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Handle date selection
  Future<void> _selectDate({required bool isCheckIn}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
          // Reset checkout date if it's before check-in
          if (checkOutDate != null && checkOutDate!.isBefore(picked)) {
            checkOutDate = null;
          }
        } else {
          if (checkInDate != null && picked.isAfter(checkInDate!)) {
            checkOutDate = picked;
          }
        }
      });
    }
  }

  // Handle booking confirmation
  void _handleBooking() {
    if (checkInDate == null || checkOutDate == null) {
      Get.snackbar(
        'Error',
        'Please select check-in and check-out dates',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Implement booking logic
    Get.snackbar(
      'Success',
      'Booking confirmed successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

