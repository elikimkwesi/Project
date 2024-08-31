import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _buildNotifications(),
        ),
      ),
    );
  }

  List<Widget> _buildNotifications() {
    // Example hardcoded notifications
    final notifications = [
      {'title': 'Alert 1', 'message': 'Temperature is out of range!'},
      {'title': 'Alert 2', 'message': 'Humidity levels are abnormal!'}
    ];

    return notifications.map((notification) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(notification['title']!),
          subtitle: Text(notification['message']!),
          contentPadding: EdgeInsets.all(16.0),
        ),
      );
    }).toList();
  }
}
