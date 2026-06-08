
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class ManageProfileScreen extends ConsumerStatefulWidget {
  const ManageProfileScreen({super.key});

  @override
  ConsumerState<ManageProfileScreen> createState() =>
      _ManageProfileScreenState();
}

class _ManageProfileScreenState
    extends ConsumerState<ManageProfileScreen> {

  final ImagePicker _picker = ImagePicker();

  File? profileImage;

  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  String selectedCountry = "Cameroon";
  String selectedGender = "Female";

  final List<String> countries = [
    "Cameroon",
    "France",
    "United Kingdom",
    "United States",
    "Canada",
  ];

  final List<String> genders = [
    "Male",
    "Female",
    "Other",
  ];

  /// 📸 PICK PROFILE IMAGE
  Future<void> pickImage() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      setState(() {
        profileImage = File(picked.path);
      });
    }
  }

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
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// 🔥 CONTENT
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// 🧠 TITLE
                      Text(
                        text.profileSettings,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// 📄 SUBTITLE
                      Text(
                        text.profileSettingsSubtitle,
                        style: TextStyle(
                          color: AppColors.light20,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// 👤 PROFILE IMAGE
                      Center(
                        child: Stack(
                          children: [

                            /// IMAGE
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColors.primarylightColour,
                              backgroundImage: profileImage != null
                                  ? FileImage(profileImage!)
                                  : const AssetImage(
                                "assets/images/illus/logo_trans.png",
                              ) as ImageProvider,
                            ),

                            /// ADD ICON
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: pickImage,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// 🧾 FULL NAME
                      _label(text.fullName),

                      _inputField(
                        controller: fullNameCtrl,
                        hint: text.enterFullName,
                        icon: Icons.person_outline,
                      ),

                      const SizedBox(height: 18),

                      /// 🌍 COUNTRY
                      _label(text.country),

                      _dropdownField(
                        value: selectedCountry,
                        items: countries,
                        onChanged: (value) {
                          setState(() {
                            selectedCountry = value!;
                          });
                        },
                        icon: Icons.flag_outlined,
                      ),

                      const SizedBox(height: 18),

                      /// ⚧ GENDER
                      _label(text.gender),

                      _dropdownField(
                        value: selectedGender,
                        items: genders,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                        icon: Icons.wc,
                      ),

                      const SizedBox(height: 18),

                      /// 📧 EMAIL
                      _label(text.emailAddress),

                      _inputField(
                        controller: emailCtrl,
                        hint: text.enterEmail,
                        icon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 18),

                      /// 📱 PHONE
                      _label(text.phoneNumber),

                      _inputField(
                        controller: phoneCtrl,
                        hint: text.enterPhoneNumber,
                        icon: Icons.phone_outlined,
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              /// 🚀 UPDATE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {

                    // TODO: UPDATE PROFILE API

                  },
                  child: Text(
                    text.updateProfile,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🧩 LABEL
  Widget _label(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  /// 🧩 INPUT FIELD
  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(
          icon,
          color: AppColors.light20,
        ),

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// 🧩 DROPDOWN FIELD
  Widget _dropdownField({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),

          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Row(
                children: [

                  Icon(
                    icon,
                    color: AppColors.light20,
                    size: 20,
                  ),

                  const SizedBox(width: 10),

                  Text(item),
                ],
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }
}
