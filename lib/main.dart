import 'package:flutter/material.dart';
import 'presentation/screens/home_screen.dart';
void main() {
  runApp(const MyBagApp());
}


class MyBagApp extends StatefulWidget {
  const MyBagApp({Key? key}) : super(key: key);

  @override
  State<MyBagApp> createState() => _MyBagAppState();
}

class _MyBagAppState extends State<MyBagApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
