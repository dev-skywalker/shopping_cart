import 'package:flutter/material.dart';
import 'package:product/pages/home_page.dart';

import 'constant/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      home: HomePage(),
    );
  }
}