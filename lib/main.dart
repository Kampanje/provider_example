import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/following.dart';

import 'homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Following() ,
      child: MaterialApp(
        home: const HomeScreen(),
      ),
    );
  }
}
