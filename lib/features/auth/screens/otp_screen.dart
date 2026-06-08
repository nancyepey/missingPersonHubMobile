

import 'package:flutter/material.dart';
import 'package:missingpeoplehub/components/app_button.dart';
import 'package:missingpeoplehub/core/network/api_client.dart';

class OTPVerificationScreen extends StatelessWidget {
  final codeController = TextEditingController();
  final auth = AuthService();

  OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: codeController),

          AppButton(
            text: "Verify",
            onPressed: () async {
              bool ok = await auth.verifyOtp("phone", codeController.text);

              if (ok) {
                Navigator.pushReplacementNamed(context, "/home");
              } else {
                Navigator.pushNamed(context, "/failed");
              }
            },
          )
        ],
      ),
    );
  }
}
