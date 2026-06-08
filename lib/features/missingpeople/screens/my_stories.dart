
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/components/language_switch.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class MyStoriesScreen extends ConsumerStatefulWidget {
  const MyStoriesScreen({super.key});

  @override
  ConsumerState<MyStoriesScreen> createState() => _MyStoriesScreenState();
}

class _MyStoriesScreenState extends ConsumerState<MyStoriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> drafts = [
    {
      "title": "Unfinished Story About Hope",
      "date": "Today",
      "image": "https://via.placeholder.com/150"
    },
  ];

  final List<Map<String, dynamic>> published = [
    {
      "title": "Finding Strength in Difficult Times",
      "date": "1 day ago",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "A Journey of Resilience",
      "date": "2 days ago",
      "image": "https://via.placeholder.com/150"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(ref);

    return Scaffold(
      backgroundColor: AppColors.backgroundColour,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),

              /// 🧭 APP BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      text.myPosts ?? "My Stories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColour,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.more_vert,
                          color: AppColors.light20Colour),
                      onPressed: () {},
                    )
                  ],
                ),
              ),

              /// 📑 TABS
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primaryColour,
                unselectedLabelColor: AppColors.light20Colour,
                indicatorColor: AppColors.primaryColour,
                tabs: [
                  Tab(text: "Drafts (${drafts.length})"),
                  Tab(text: "Published (${published.length})"),
                ],
              ),

              /// 📋 CONTENT
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildList(drafts, isDraft: true),
                    _buildList(published, isDraft: false),
                  ],
                ),
              ),
            ],
          ),

          /// 🌐 LANGUAGE SWITCH (TOP RIGHT)
          const Positioned(
            top: 50,
            right: 20,
            child: LanguageSwitch(),
          ),
        ],
      ),

      /// ➕ FAB
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColour,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),*/
    );
  }


  //handle images
  Widget _buildThumbnail(String? imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 70,
        height: 70,
        color: AppColors.inputBg,
        child: (imageUrl == null || imageUrl.isEmpty)
            ? Icon(Icons.image, color: AppColors.light20Colour)
            : Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image,
                color: AppColors.light20Colour);
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primaryColour,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildList(List<Map<String, dynamic>> stories,
      {required bool isDraft}) {
    if (stories.isEmpty) {
      return Center(
        child: Text(
          isDraft
              ? "No drafts yet. Start writing!"
              : "No published stories yet.",
          style: TextStyle(color: AppColors.light20Colour),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final story = stories[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.bgColour,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
              )
            ],
          ),
          child: Row(
            children: [
              /// 🖼️ THUMBNAIL
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _buildThumbnail(story["image"]),
                /*child: Image.network(
                  story["image"],
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),*/
              ),

              const SizedBox(width: 12),

              /// 📄 TEXT CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story["title"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.primaryColour,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      story["date"],
                      style: TextStyle(
                        color: AppColors.light20Colour,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              /// ⚙️ ACTIONS
              Column(
                children: [
                  if (isDraft)
                    IconButton(
                      icon: Icon(Icons.edit,
                          color: AppColors.secondary),
                      onPressed: () {},
                    ),
                  IconButton(
                    icon: Icon(Icons.more_vert,
                        color: AppColors.light20Colour),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
