
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.splash);
      //Navigator.pushReplacementNamed(context, AppRoutes.walkthrough);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(Icons.location_searching, size: 80, color: Colors.white),
            SizedBox(
              child: Image.asset(
                "assets/images/logo_trans.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "MissingPeopleHub",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
