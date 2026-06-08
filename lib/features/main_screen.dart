
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:missingpeoplehub/features/missingpeople/screens/add_missing_person.dart';
import 'package:missingpeoplehub/features/missingpeople/screens/my_stories.dart';
import 'package:missingpeoplehub/features/missingpeople/screens/stories.dart';
import 'package:missingpeoplehub/features/settings/screens/settings_screen.dart';
import 'package:missingpeoplehub/resources/app_text.dart';
import 'home_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const StoriesScreen(),
    const AddMissingPeopleScreen(), // placeholder for "+"
    const MyStoriesScreen(), // My Posts (later)
    const SettingsScreen(), // Settings (later)
  ];

  @override
  Widget build(BuildContext context) {

    final text = AppText.of(ref);

    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,

        onTap: (index) {

          /// 🔥 SPECIAL CASE → CREATE POST
          if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.addMissingPeople);
            return;
          }

          /// 🔥 NORMAL TAB SWITCH
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: text.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.auto_stories),
            label: text.stories,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: 40,
              color: AppColors.primary,
            ),
            label: text.createPost,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.post_add),
            label: text.myPosts,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: text.settings,
          ),
        ],
      ),
    );
  }
}
