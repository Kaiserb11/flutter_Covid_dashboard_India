import 'package:flutter/material.dart';
import 'package:flutter_Covid_dashboard_India/pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'covid symptom app',
      debugShowCheckedModeBanner: false,
      home: StatPage(),
    );
  }
}
