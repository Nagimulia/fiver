import 'package:flutter/material.dart';
import 'package:vitaliy/home_page.dart';
import 'package:vitaliy/services/NotificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  await notificationService.initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Local Notification',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
