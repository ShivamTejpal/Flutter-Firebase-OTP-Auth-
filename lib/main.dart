import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_app/phoneauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyD35PimPLrBLb0Hrf1ChS80toLf3-HdkQc',
              appId: '1:944481829440:android:2b0c29470a9a9eab3655a5',
              messagingSenderId: '944481829440',
              projectId: 'email-auth-cb4a2'))
      : await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Phoneauth(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: WelcomeContent(),
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star, // Replace with an appropriate icon
          size: 100,
          color: Colors.white,
        ),
        const SizedBox(height: 20),
        const Text(
          'Welcome to My App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Let\'s get started!',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            // Add navigation logic here
          },
          child: const Text(
            'Get Started',
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor:
                Colors.white, // Use backgroundColor instead of primary
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
