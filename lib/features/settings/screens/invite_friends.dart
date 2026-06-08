
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class InviteFriendsScreen extends ConsumerStatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  ConsumerState<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends ConsumerState<InviteFriendsScreen> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final messageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final text = AppText.of(ref);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(text.inviteFriends),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// 🔥 CONTENT
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      /// 🖼️ IMAGE
                      Image.asset(
                        "assets/images/illus/inviteFriendimagesNoBG.png",
                        height: 240,
                      ),

                      const SizedBox(height: 16),

                      /// 🧠 TITLE
                      Text(
                        text.inviteTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// 📄 SUBTITLE
                      Text(
                        text.inviteSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.light20,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🧾 FORM
                      _input(nameCtrl, text.yourName),
                      _input(emailCtrl, text.yourEmail),

                      _textarea(
                        messageCtrl,
                        text.message,
                        defaultText: text.inviteMessageDefault,
                      ),
                    ],
                  ),
                ),
              ),

              /// 🚀 BUTTON (BOTTOM)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final name = nameCtrl.text.trim();
                    final email = emailCtrl.text.trim();
                    final message = messageCtrl.text.trim();

                    if (name.isEmpty || email.isEmpty) {
                      // TODO: show validation
                      return;
                    }

                    // TODO: send invite API

                  },
                  child: Text(
                    text.sendInvite,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  /// 🧩 INPUT FIELD
  Widget _input(TextEditingController ctrl, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// 🧩 TEXTAREA (MULTI-LINE)
  Widget _textarea(
      TextEditingController ctrl,
      String hint, {
        String? defaultText,
      }) {
    if (ctrl.text.isEmpty && defaultText != null) {
      ctrl.text = defaultText;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: ctrl,
        minLines: 4,
        maxLines: 6,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
