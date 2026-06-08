
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class ReportBugScreen extends ConsumerStatefulWidget {
  const ReportBugScreen({super.key});

  @override
  ConsumerState<ReportBugScreen> createState() => _ReportBugScreenState();
}

class _ReportBugScreenState extends ConsumerState<ReportBugScreen> {

  final titleCtrl = TextEditingController();
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
        title: Text(text.reportBug),
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

                      /// 🖼️ IMAGE (reuse same branding)
                      Image.asset(
                        "assets/images/illus/bug_imgNoBG.png",
                        height: 140,
                      ),

                      const SizedBox(height: 16),

                      /// 🧠 TITLE
                      Text(
                        text.bugTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// 📄 SUBTITLE
                      Text(
                        text.bugSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.light20,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🧾 FORM
                      _input(titleCtrl, text.bugInputTitle),

                      _textarea(
                        messageCtrl,
                        text.bugDescription,
                        defaultText: text.bugMessageDefault,
                      ),
                    ],
                  ),
                ),
              ),

              /// 🚀 BUTTON
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
                    final title = titleCtrl.text.trim();
                    final message = messageCtrl.text.trim();

                    if (title.isEmpty || message.isEmpty) {
                      // TODO: validation message
                      return;
                    }

                    // TODO: send bug report API

                  },
                  child: Text(
                    text.sendReport,
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

  /// 🧩 INPUT
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
        maxLines: 8,
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
