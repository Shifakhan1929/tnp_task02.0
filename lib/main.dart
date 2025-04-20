import 'package:flutter/material.dart';
import 'package:myapp/practice_sessioon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

