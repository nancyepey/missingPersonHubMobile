
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/components/custom_button.dart';
import 'package:missingpeoplehub/components/custom_textfield.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final text = AppText.of(ref);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// LOGO
            SizedBox(
              child: Image.asset(
                "assets/images/logo01.jpeg",
                height: 100,
              ),
            ),

            /// TITLE
            Text(
              text.createAccount,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// NAME
            CustomTextField(
              hint: text.fullName,
            ),

            const SizedBox(height: 10),

            /// EMAIL
            CustomTextField(
              hint: text.emailAddress,
            ),

            const SizedBox(height: 10),

            /// PASSWORD
            CustomTextField(
              hint: text.password,
              isPassword: true,
            ),

            const SizedBox(height: 20),

            /// SIGNUP BUTTON
            CustomButton(
              text: text.signup,
              onPressed: () {},
            ),

            const SizedBox(height: 10),

            /// LOGIN LINK
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: Text(
                "${text.alreadyHaveAnAccount} ${text.login}",
              ),
            )
          ],
        ),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:missingpeoplehub/components/custom_button.dart';
import 'package:missingpeoplehub/components/custom_textfield.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Create Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const CustomTextField(hint: "Name"),
            const SizedBox(height: 10),

            const CustomTextField(hint: "Email"),
            const SizedBox(height: 10),

            const CustomTextField(hint: "Password", isPassword: true),

            const SizedBox(height: 20),

            CustomButton(
              text: "Sign Up",
              onPressed: () {},
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: const Text("Already have an account? Login"),
            )
          ],
        ),
      ),
    );
  }
}
*/
