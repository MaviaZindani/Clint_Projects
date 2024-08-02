import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Image.asset('assets/images/SplashScreen/intro image.png')
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Secoure your shops and home'),
              const SizedBox(
                height: 60,
              ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/home');
              }, 
              child: const Text('Get Start')
              ),
          ],
        ),
      ),
    );
  }
}