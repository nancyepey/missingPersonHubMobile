
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/components/language_switch.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:missingpeoplehub/resources/app_styles.dart';
import 'package:missingpeoplehub/resources/app_text.dart';


class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = AppText.of(ref);

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/images/splash/walkthrough4.png",
              fit: BoxFit.cover,
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          /// 🔥 LANGUAGE SWITCH TOP RIGHT
          Positioned(
            top: 50,
            right: 20,
            child: const LanguageSwitch(),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text.walkthroughTitle1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                text.walkthroughDescription1,
                style: const TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.walkthrough);
                  },
                  child: Text(
                      text.continueText ?? "Continue",
                    style: TextStyle(
                      color: AppColors.textWhiteColour
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

/*

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/images/splash/splash_group.png",
              fit: BoxFit.cover,
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Find Missing People\nFaster with One Click!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Connecting communities to reunite families.",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, AppRoutes.welcome);
                    Navigator.pushNamed(context, AppRoutes.walkthrough);
                  },
                  child: Text(
                      "Get Started",
                    style: TextStyle(
                      color: AppColors.textWhiteColour,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
*/







/*

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/welcome");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Image.asset("assets/1.png"),
          Image.asset("assets/2.png"),
          Image.asset("assets/3.png"),
          Image.asset("assets/4.png"),
        ],
      ),
    );
  }
}
*/

