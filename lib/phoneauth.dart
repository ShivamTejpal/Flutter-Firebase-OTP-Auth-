import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_app/otpscreen.dart';

class Phoneauth extends StatefulWidget {
  const Phoneauth({Key? key});

  @override
  State<Phoneauth> createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "Phone Authentication",
    style: TextStyle(
      color: Colors.black, // Title color
      fontWeight: FontWeight.bold, // Title font weight
    ),
  ),
  centerTitle: true,
),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8E24AA), // Purple
              Color(0xFF4A148C), // Dark Purple
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.8], // Adjust the stops as needed
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white), // Text color
                  decoration: const InputDecoration(
                    labelText: "Enter Phone Number",
                    labelStyle: TextStyle(color: Colors.white), // Label color
                    prefixIcon: Icon(Icons.phone, color: Colors.white), // Icon color
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Border color
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (phoneAuthCredential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationId, int? resendtoken) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(verificationid: verificationId),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: phoneController.text.toString(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  child: const Text("Verify Phone Number"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
