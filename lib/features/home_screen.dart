
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/components/language_switch.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final text = AppText.of(ref);

    return Scaffold(
      backgroundColor: AppColors.background,

      /// 🔻 BOTTOM NAV
      //bottomNavigationBar: _bottomNav(text),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔝 HEADER
              _header(text),

              const SizedBox(height: 20),

              /// 🔍 SEARCH
              _searchBar(text),

              const SizedBox(height: 20),

              /// 🔥 CAROUSEL TITLE
              Text(
                text.searchMissing, // reuse string
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              /// 🎠 HORIZONTAL CAROUSEL
              _carousel(),

              const SizedBox(height: 20),

              /// 📋 LIST TITLE
              Text(
                text.reportMissing,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              /// 📜 VERTICAL LIST
              _recentList(text),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔝 HEADER
  Widget _header(dynamic text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text.welcomeBack,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              text.appName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// 🔥 LANGUAGE SWITCH TOP RIGHT
            Positioned(
              top: 50,
              right: 20,
              child: const LanguageSwitch(),
            ),
            const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=3",
              ),
            )
          ],
        ),


      ],
    );
  }

  /// 🔍 SEARCH BAR
  Widget _searchBar(text) {
    return TextField(
      decoration: InputDecoration(
        //hintText: "Search missing person...",
        hintText: text.searchMissing,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// 🎠 CAROUSEL
  Widget _carousel() {
    final List<Map<String, String>> data = [
      {
        "name": "John Doe",
        "location": "Douala",
        "image": "https://picsum.photos/400/300?1"
      },
      {
        "name": "Mary Smith",
        "location": "Yaoundé",
        "image": "https://picsum.photos/400/300?2"
      },
      {
        "name": "Kevin Lee",
        "location": "Bafoussam",
        "image": "https://picsum.photos/400/300?3"
      },
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {

          final item = data[index];

          return Container(
            width: 260,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(item["image"]!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    item["name"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item["location"]!,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 📜 RECENT LIST
  Widget _recentList(text) {


    final List<Map<String, String>> data = [
      {
        "name": "Anna Bell",
        "location": "Douala",
        "image": "https://picsum.photos/200?1"
      },
      {
        "name": "Chris Paul",
        "location": "Yaoundé",
        "image": "https://picsum.photos/200?2"
      },
      {
        "name": "Anna Bell",
        "location": "Douala",
        "image": "https://picsum.photos/200?1"
      },
      {
        "name": "Chris Paul",
        "location": "Yaoundé",
        "image": "https://picsum.photos/200?2"
      },
    ];

    return Column(
      children: data.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [

              /// IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item["image"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              /// INFO
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item["location"]!),
                  ],
                ),
              ),

              /// ACTION
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgroundDanger,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child:  Text(
                    text.missing,
                  style: TextStyle(
                    color: AppColors.textWhiteColour,
                  ),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  /// 🔻 BOTTOM NAV
  Widget _bottomNav(text) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
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
            color: AppColors.primary,
            size: 40,
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
    );
    /*return BottomNavigationBar(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: text.home),
        BottomNavigationBarItem(icon: Icon(Icons.screen_search_desktop), label: text.discover),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.add_circle_outline_rounded,
              color: AppColors.primaryColour,
              size: 40,
            ),
            label: text.search
        ),
        BottomNavigationBarItem(icon: Icon(Icons.post_add), label: text.myPosts),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: text.settings),
        *//*BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Groups"),
        BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "My Posts"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),*//*
      ],
    );*/
  }
}







/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Missing People"),
            onTap: () => Navigator.pushNamed(context, "/missing"),
          ),
          ListTile(
            title: Text("Groups"),
            onTap: () => Navigator.pushNamed(context, "/groups"),
          ),
        ],
      ),
    );
  }
}
*/

