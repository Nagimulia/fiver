import 'package:flutter/material.dart';
import 'package:vitaliy/home_page.dart';
import 'package:vitaliy/services/NotificationService.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Local Notification',
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
