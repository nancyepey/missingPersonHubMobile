
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class StoryDetailScreen extends ConsumerWidget {
  const StoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final text = AppText.of(ref);

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.bookmark_border),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGE
            Image.network("https://picsum.photos/400/250"),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Missing Child in Douala",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  /// AUTHOR
                  Row(
                    children: const [
                      CircleAvatar(radius: 14),
                      SizedBox(width: 8),
                      Text("John Doe"),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// COMMENTS BUTTON
                  GestureDetector(
                    onTap: () => _openCommentModal(context, text),
                    child: Row(
                      children: [
                        const Icon(Icons.comment),
                        const SizedBox(width: 6),
                        Text("10 ${text.comments}"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// DESCRIPTION
                  const Text(
                    "This child has been missing since yesterday near Douala market...",
                  ),

                  const SizedBox(height: 20),

                  /// CONTACT
                  Text(
                    text.contactInfo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text("Phone: +237 XXX XXX XXX"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 💬 COMMENT MODAL
  void _openCommentModal(BuildContext context, dynamic text) {

    final TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 🔥 important for keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// 🔝 DRAG HANDLE
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              /// 💬 TEXTAREA (MULTI-LINE)
              TextField(
                controller: controller,
                minLines: 3, // 🔥 starts with 3 lines
                maxLines: 6, // 🔥 expands vertically
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: text.writeComment,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// 🚀 SEND BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, // ✅ primary color
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final comment = controller.text.trim();

                    if (comment.isEmpty) return;

                    // TODO: send to API
                    Navigator.pop(context);
                  },
                  child: Text(
                    text.send,
                    style: const TextStyle(
                      color: Colors.white, // ✅ white text
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }


  /// COMMENTS MODAL SIMPLE
  void _openCommentModalSimple(BuildContext context, dynamic text) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                decoration: InputDecoration(
                  hintText: text.writeComment,
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {},
                child: Text(text.send),
              )
            ],
          ),
        );
      },
    );
  }
}

