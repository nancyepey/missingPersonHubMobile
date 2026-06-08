
/*
class AppRoutes {
  static const splash = "/";
  static const welcome = "/welcome";
  static const login = "/login";
  static const signup = "/signup";
  static const otp = "/otp";
  static const home = "/home";
}
*/


import 'package:flutter/material.dart';
import 'package:missingpeoplehub/features/auth/screens/login_screen.dart';
import 'package:missingpeoplehub/features/auth/screens/signup_screen.dart';
import 'package:missingpeoplehub/features/home_screen.dart';
import 'package:missingpeoplehub/features/main_screen.dart';
import 'package:missingpeoplehub/features/missingpeople/screens/add_missing_person.dart';
import 'package:missingpeoplehub/features/missingpeople/screens/my_stories.dart';
import 'package:missingpeoplehub/features/missingpeople/screens/stories.dart';
import 'package:missingpeoplehub/features/missingpeople/screens/story_details.dart';
import 'package:missingpeoplehub/features/profile/screens/manage_profile.dart';
import 'package:missingpeoplehub/features/settings/screens/invite_friends.dart';
import 'package:missingpeoplehub/features/settings/screens/report_bug.dart';
import 'package:missingpeoplehub/features/settings/screens/settings_screen.dart';
import 'package:missingpeoplehub/features/welcome/screens/logo_screen.dart';
import 'package:missingpeoplehub/features/welcome/screens/splash_screen.dart';
import 'package:missingpeoplehub/features/welcome/screens/walkthrough.dart';
import 'package:missingpeoplehub/features/welcome/screens/welcome_screen.dart';

class AppRoutes {
  static const logo = '/';
  static const splash = '/splash';
  static const login = '/login';
  static const signup = '/signup';
  static const welcome = '/welcome';
  static const walkthrough = '/walkthrough';
  static const main = '/main';
  static const home = '/home';
  static const stories = '/stories';
  static const storyDetail = '/storyDetail';
  static const myStories = '/myStories';
  static const addMissingPeople = '/addMissingPeople';
  static const settings = '/settings';
  static const inviteFriends = '/inviteFriends';
  static const reportBug = '/reportBug';
  static const manageProfile = '/manageProfile';

  static Map<String, WidgetBuilder> routes = {
    logo: (_) => const LogoScreen(),
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    signup: (_) => const SignupScreen(),
    welcome: (_) => const WelcomeScreen(),
    walkthrough: (_) => const WalkthroughScreen(),
    main: (_) => const MainScreen(),
    home: (_) => const HomeScreen(),
    stories: (_) => const StoriesScreen(),
    storyDetail: (_) => const StoryDetailScreen(),
    myStories: (_) => const MyStoriesScreen(),
    addMissingPeople: (_) => const AddMissingPeopleScreen(),
    settings: (_) => const SettingsScreen(),
    inviteFriends: (_) => const InviteFriendsScreen(),
    reportBug: (_) => const ReportBugScreen(),
    manageProfile: (_) => const ManageProfileScreen(),
  };
}