import 'NotificationService.dart';
import 'package:flutter/material.dart';


class MainDashboard extends StatelessWidget {
  MainDashboard({Key? key}) : super(key: key);

 NotificationService ns = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainDashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ns.showNotification();
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
