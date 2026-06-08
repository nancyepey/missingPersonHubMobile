
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/components/ui/button.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:missingpeoplehub/models/slide.dart';
import 'package:missingpeoplehub/resources/app_text.dart';
import 'package:missingpeoplehub/resources/app_styles.dart';

class WalkthroughScreen extends ConsumerStatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  ConsumerState<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends ConsumerState<WalkthroughScreen> {

  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    /// 🔥 GET CURRENT LANGUAGE STRINGS
    final text = AppText.of(ref);

    /// 🔥 BUILD SLIDES DYNAMICALLY (IMPORTANT)
    final List<SlideModel> slides = [
      SlideModel(
        text.walkthroughTitle1,
        text.walkthroughDescription1,
        "assets/images/splash/walkthrough1.png",
      ),
      SlideModel(
        text.walkthroughTitle2,
        text.walkthroughDescription2,
        "assets/images/splash/walkthrough2.png",
      ),
      SlideModel(
        text.walkthroughTitle3,
        text.walkthroughDescription3,
        "assets/images/splash/walkthrough3.png",
      ),
      SlideModel(
        text.walkthroughTitle3,
        text.walkthroughDescription3,
        "assets/images/splash/walkthrough4.png",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.bglightColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// SLIDES
          Expanded(
            child: walkthroughPages(slides),
          ),

          /// FOOTER
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                indicators(slides),
                const SizedBox(height: 24),
                buttonsAuth(text),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔵 INDICATORS
  Widget indicators(List slides) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < slides.length; i++) ...[
          InkWell(
            onTap: () {
              if (i != currentPage) {
                pageController.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Icon(
              Icons.circle,
              size: currentPage == i ? 16 : 8,
              color: currentPage == i
                  ? AppColors.primaryColour
                  : AppColors.primarylightColour,
            ),
          ),
          if (i < slides.length - 1) const SizedBox(width: 8),
        ]
      ],
    );
  }

  /// 🔵 BUTTONS (NOW DYNAMIC LANGUAGE)
  Widget buttonsAuth(dynamic text) {
    return Column(
      children: [
        ButtonComponent(
          label: text.signup,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.signup);
          },
        ),
        const SizedBox(height: 16),
        ButtonComponent(
          label: text.login,
          type: ButtonType.secondary,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.login);
          },
        ),
      ],
    );
  }

  /// 🔵 PAGES
  Widget walkthroughPages(List<SlideModel> slides) {
    return PageView.builder(
      controller: pageController,
      itemCount: slides.length,
      onPageChanged: (index) => setState(() => currentPage = index),
      itemBuilder: (context, index) {
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 48),

            Center(
              child: Image.asset(
                slides[index].image,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),

            const SizedBox(height: 22),

            Text(
              slides[index].title,
              style: AppStyles.title1(),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            Text(
              slides[index].description,
              style: AppStyles.regular1(
                color: AppColors.light20Colour,
                weight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}




/*

import 'package:flutter/material.dart';
import 'package:missingpeoplehub/components/ui/button.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:missingpeoplehub/models/slide.dart';
import 'package:missingpeoplehub/resources/app_strings.dart';
import 'package:missingpeoplehub/resources/app_styles.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {

  PageController pageController = PageController();
  final strings = AppStrings();

  List<SlideModel> slides = [
    SlideModel(
        AppStrings.walkthroughTitle1,
        AppStrings.walkthroughDescription1,
        "assets/images/splash/walkthrough1.png"
    ),
    SlideModel(
        AppStrings.walkthroughTitle2,
        AppStrings.walkthroughDescription2,
        "assets/images/splash/walkthrough2.png"
    ),
    SlideModel(
        AppStrings.walkthroughTitle3,
        AppStrings.walkthroughDescription3,
        "assets/images/splash/walkthrough3.png"
    ),
    SlideModel(
        AppStrings.walkthroughTitle3,
        AppStrings.walkthroughDescription3,
        "assets/images/splash/walkthrough4.png"
    ),
  ];

  int currentPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bglightColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: walkthroughPages()
          ),


          Padding(
            padding: const EdgeInsets.all( 24.0),
            child: Column(
              children: [
                indicators(),
                const SizedBox(
                  height: 24,
                ),
                buttonsAuth(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

  //indicators widgets
  Widget indicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for(int i = 0; i < slides.length; i++)...[
          InkWell(
            onTap: () {
              if(i != currentPage) pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Icon(
              Icons.circle,
              size: currentPage == i ? 16 : 8,
              color: currentPage == i ? AppColors.primaryColour : AppColors.primarylightColour,
            ),
          ),
          if(i < slides.length-1) const SizedBox(width: 8,)
        ]

      ],
    );
  }


  //buttons signuo and login widgets
  Widget buttonsAuth() {
    return Column(
      children: [
        ButtonComponent(
          label: AppStrings.signup,
          onPressed: () => {
            Navigator.of(context).pushNamed(AppRoutes.signup)

          },
        ),
        const SizedBox(
          height: 16,
        ),
        ButtonComponent(
            label: AppStrings.login,
            type: ButtonType.secondary,
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.login)
        ),
      ],
    );
  }



  //pages walkthrough
  Widget walkthroughPages() {
    return PageView.builder(itemBuilder: (context, index){
      return ListView(
        padding: const EdgeInsets.all( 24),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 48,
          ),
          Center(
            child: Image.asset(
              slides[index].image,
              width: MediaQuery.of(context).size.width/1.5,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            slides[index].title,
            style: AppStyles.title1(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            slides[index].description,
            style: AppStyles.regular1(
              color: AppColors.light20Colour,
              weight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    },
      controller: pageController,
      itemCount: slides.length,
      onPageChanged: (index) => setState(() => currentPage = index ),
    );
  }

}
*/


