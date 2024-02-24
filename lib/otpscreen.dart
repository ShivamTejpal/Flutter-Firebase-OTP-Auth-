import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_app/main.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String verificationid;
  OTPScreen({super.key, required this.verificationid});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTPScreen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter The OTP',
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: widget.verificationid,
                        smsCode: otpController.text.toString());
                FirebaseAuth.instance.signInWithCredential(credential).then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen(title:"My home page")));
                });
              } catch (ex) {
                log(ex.toString());
              }
            },
            child: const Text("Verify Phone Number"),
          ),
        ],
      ),
    );
  }
}
