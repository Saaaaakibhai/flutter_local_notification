import 'package:flutter/material.dart';
import 'package:local_push_notification/screen/noti_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notiService = NotiService(); // use singleton

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: const Text('Local Notification')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            notiService.showNotification(
              title: "Hello!",
              body: "This is a local notification.",
            );
          },
          child: const Text("Show Notification"),
        ),
      ),
    );
  }
}
