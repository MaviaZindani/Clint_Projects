import 'package:basic_ui/utils/routes_name.dart';
import 'package:flutter/material.dart';
import 'view/homeScreen/home_screen.dart';
import 'view/splashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        RoutesName.intro: (context) => const SplashScreen(),
        RoutesName.home: (context) => const HomeScreen(),
      },
      initialRoute: RoutesName.intro,
    );
  }
}
