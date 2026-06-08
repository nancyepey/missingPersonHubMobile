

import 'package:flutter/material.dart';
import 'package:missingpeoplehub/components/app_button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'dart:io';

import 'package:missingpeoplehub/resources/app_text.dart';


class AddMissingPeopleScreen extends ConsumerStatefulWidget {
  const AddMissingPeopleScreen({super.key});

  @override
  ConsumerState<AddMissingPeopleScreen> createState() =>
      _AddMissingPeopleScreenState();
}

class _AddMissingPeopleScreenState
    extends ConsumerState<AddMissingPeopleScreen> {

  final picker = ImagePicker();

  File? coverImage;
  List<File> otherImages = [];

  /// Controllers
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  final phone1Ctrl = TextEditingController();
  final phone2Ctrl = TextEditingController();
  final email1Ctrl = TextEditingController();
  final email2Ctrl = TextEditingController();

  final lastSeenCtrl = TextEditingController();
  final dressCtrl = TextEditingController();

  /// 📸 PICK COVER IMAGE
  Future<void> pickCoverImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        coverImage = File(picked.path);
      });
    }
  }

  /// 📸 PICK OTHER IMAGES (MAX 3)
  Future<void> pickOtherImages() async {
    if (otherImages.length >= 3) return;

    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        otherImages.add(File(picked.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(ref);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(text.createPost),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔘 SAVE / PUBLISH
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Save draft
                    },
                    child: Text(text.save ?? "Save"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      // TODO: Publish
                    },
                    child: Text(
                      text.publish ?? "Publish",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// 🖼️ COVER IMAGE (REQUIRED)
            GestureDetector(
              onTap: pickCoverImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: coverImage == null
                    ? Center(child: Text(text.addCoverImage ?? "Add Cover Image"))
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(coverImage!, fit: BoxFit.cover),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// 🖼️ OTHER IMAGES
            Row(
              children: [
                ...otherImages.map((img) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.file(img, width: 70, height: 70),
                )),
                if (otherImages.length < 3)
                  GestureDetector(
                    onTap: pickOtherImages,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  )
              ],
            ),

            const SizedBox(height: 20),

            /// 🧾 FORM
            _input(nameCtrl, text.name),
            _input(ageCtrl, text.age ?? "Age"),
            _input(genderCtrl, text.gender ?? "Gender"),

            _input(titleCtrl, text.title ?? "Title"),
            _textarea(descCtrl, text.description ?? "Description"),

            const SizedBox(height: 10),

            /// 📞 CONTACT
            _sectionTitle(text.contactInfo),

            _input(phone1Ctrl, "Phone 1"),
            _input(phone2Ctrl, "Phone 2"),
            _input(email1Ctrl, "Email 1"),
            _input(email2Ctrl, "Email 2"),

            const SizedBox(height: 10),

            /// 📍 LAST SEEN
            _sectionTitle(text.lastSeen ?? "Last Seen"),

            _input(lastSeenCtrl, text.location ?? "Location"),
            _input(dressCtrl, text.dress ?? "Clothing description"),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// 🧩 INPUT
  Widget _input(TextEditingController ctrl, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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

  /// 🧩 TEXTAREA
  Widget _textarea(TextEditingController ctrl, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: ctrl,
        minLines: 3,
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

  /// 🧩 SECTION TITLE
  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


/*
class AddMissingPerson extends StatelessWidget {


  final name = TextEditingController();

  AddMissingPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: name),

          AppButton(
            text: "Submit",
            onPressed: () {
              // send to API or save offline
            },
          )
        ],
      ),
    );
  }
}
*/

