import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit_clone/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Clone',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Color(0xFF040404),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF131313),
            iconTheme: IconThemeData(color: Colors.grey[700]),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF131313),
            unselectedItemColor: Colors.grey[700],
          )),
      home: HomeScreen(),
    );
  }
}
