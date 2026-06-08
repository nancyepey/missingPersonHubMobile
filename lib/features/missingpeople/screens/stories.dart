
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/components/language_switch.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class StoriesScreen extends ConsumerStatefulWidget {
  const StoriesScreen({super.key});

  @override
  ConsumerState<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends ConsumerState<StoriesScreen> {

  int selectedTab = 0;

  final tabs = ["all", "missing", "found"];

  @override
  Widget build(BuildContext context) {

    final text = AppText.of(ref);

    return Scaffold(
      backgroundColor: AppColors.background,

    /*  appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(text.discoverStories),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const LanguageSwitch(),
          const SizedBox(width: 10),
        ],
      ),*/

      body: Column(
        children: [
          const SizedBox(height:  60),
          //Row
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 30, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text.discoverStories, style: TextStyle(
                  fontSize: 20,
                ),),
                //const LanguageSwitch(),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.search, size: 28,),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          /// 🔵 FILTER TABS
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _tab(text.all, 0),
                _tab(text.missing, 1),
                _tab(text.found, 2),
              ],
            ),
          ),

          /// 🔥 STORIES LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (_, i) => _storyCard(text),
            ),
          )
        ],
      ),
    );
  }

  Widget _tab(String label, int index) {
    final isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _storyCard(dynamic text) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.storyDetail);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 📄 CONTENT (LEFT)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔴 TITLE
                  const Text(
                    "Missing Child in Douala Missing Child in DoualaMissing Child in DoualaMissing Child in DoualaMissing Child in DoualaMissing Child in Douala",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  /// 👤 AUTHOR
                  Row(
                    children: const [
                      CircleAvatar(radius: 10),
                      SizedBox(width: 6),
                      Text("John Doe", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// 📊 META
                  Row(
                    children: [
                      const Text("2h"),
                      const SizedBox(width: 10),
                      Text("120 ${text.views}"),
                      const SizedBox(width: 10),
                      Text("10 ${text.comments}"),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(width: 12),

            /// 🖼️ IMAGE + MENU (RIGHT)
            Stack(
              children: [

                /// IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://picsum.photos/200",
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),

                /// 🔥 3 DOT MENU (TOP RIGHT)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.more_vert, // ✅ vertical dots
                        color: Colors.white,
                        size: 20,
                      ),
                      onSelected: (value) {},
                      itemBuilder: (_) => [
                        PopupMenuItem(value: "bookmark", child: Text(text.bookmark)),
                        PopupMenuItem(value: "report", child: Text(text.report)),
                        PopupMenuItem(value: "info", child: Text(text.sendInfo)),
                        PopupMenuItem(value: "feedback", child: Text(text.feedback)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _storyCardWrong3(dynamic text) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.storyDetail);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 📄 CONTENT (LEFT)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔴 TITLE + MENU
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Missing Child in Douala",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /// 3 DOT MENU
                      PopupMenuButton<String>(
                        padding: EdgeInsets.zero,
                        onSelected: (value) {},
                        itemBuilder: (_) => [
                          PopupMenuItem(value: "bookmark", child: Text(text.bookmark)),
                          PopupMenuItem(value: "report", child: Text(text.report)),
                          PopupMenuItem(value: "info", child: Text(text.sendInfo)),
                          PopupMenuItem(value: "feedback", child: Text(text.feedback)),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// 👤 AUTHOR
                  Row(
                    children: const [
                      CircleAvatar(radius: 10),
                      SizedBox(width: 6),
                      Text("John Doe", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// 📊 META
                  Row(
                    children: [
                      const Text("2h"),
                      const SizedBox(width: 10),
                      Text("120 ${text.views}"),
                      const SizedBox(width: 10),
                      Text("10 ${text.comments}"),
                    ],
                  )
                ],
              ),
            ),


            const SizedBox(width: 12),


            /// 🖼️ IMAGE (RIGHT)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://picsum.photos/200",
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storyCardDif(dynamic text) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.storyDetail);
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const StoryDetailScreen(),
          ),
        );*/
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// COVER IMAGE
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    "https://picsum.photos/400/200",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 10,
                  top: 10,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {},
                    itemBuilder: (_) => [
                      PopupMenuItem(value: "bookmark", child: Text(text.bookmark)),
                      PopupMenuItem(value: "report", child: Text(text.report)),
                      PopupMenuItem(value: "info", child: Text(text.sendInfo)),
                      PopupMenuItem(value: "feedback", child: Text(text.feedback)),
                    ],
                  ),
                )
              ],
            ),

            /// CONTENT
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Missing Child in Douala",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  /// AUTHOR
                  Row(
                    children: const [
                      CircleAvatar(radius: 10),
                      SizedBox(width: 6),
                      Text("John Doe", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// META
                  Row(
                    children: [
                      Text("2h"),
                      const SizedBox(width: 10),
                      Text("120 ${text.views}"),
                      const SizedBox(width: 10),
                      Text("10 ${text.comments}"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
