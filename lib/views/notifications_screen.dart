import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildNotificationItem();
        },
      ),
    );
  }

  Widget _buildNotificationItem() {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.notifications,
          color: AppColors.primary,
        ),
      ),
      title: const Text(
        'Booking Confirmed',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Your booking at Dolphin Hotel has been confirmed.',
        style: AppStyles.subHeaderStyle,
      ),
      trailing: Text(
        '2h ago',
        style: AppStyles.subHeaderStyle.copyWith(fontSize: 12),
      ),
    );
  }
} 