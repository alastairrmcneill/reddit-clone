import 'package:flutter/material.dart';
import 'package:reddit_clone/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Color(0xFF040404),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF131313),
            unselectedItemColor: Colors.grey[700],
          )),
      home: HomeScreen(),
    );
  }
}
