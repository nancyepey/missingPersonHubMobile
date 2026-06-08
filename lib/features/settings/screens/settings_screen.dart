
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/components/language_switch.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:missingpeoplehub/resources/app_text.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {

  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {

    final text = AppText.of(ref);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 👤 PROFILE HEADER
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=5",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "John Doe",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("johndoe@email.com"),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ⚙️ MENU LIST
            _tile(
              icon: Icons.language,
              title: text.language,
              trailing: const LanguageSwitch(),
            ),

            _tile(
              icon: Icons.person,
              title: text.manageProfile,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.manageProfile);
              },
            ),

            _tile(
              icon: Icons.help_outline,
              title: text.faq,
            ),

            _tile(
              icon: Icons.verified_user,
              title: text.verification,
            ),

            /// 🔔 NOTIFICATIONS SWITCH
            _tile(
              icon: Icons.notifications,
              title: text.notifications,
              trailing: Switch(
                value: notificationsEnabled,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),

            /*_tile(
              icon: Icons.bug_report,
              title: text.reportBug,
            ),*/

            _tile(
              icon: Icons.bug_report,
              title: text.reportBug,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.reportBug);
              },
            ),

           /* _tile(
                icon: Icons.people_alt,
                title: text.inviteFriends,
              ),*/
            _tile(
              icon: Icons.people_alt,
              title: text.inviteFriends,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.inviteFriends);
              },
            ),





            const SizedBox(height: 20),

            /// 🚪 LOGOUT
            GestureDetector(
              onTap: () {
                // TODO: logout logic
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    text.logout,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// 🧩 REUSABLE TILE
  Widget _tile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: AppColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title),
              ),
              if (trailing != null)
                trailing
              else
                const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
  /*
  Widget _tile({
    required IconData icon,
    required String title,
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          Icon(icon, color: AppColors.primary),

          const SizedBox(width: 12),

          Expanded(
            child: Text(title),
          ),

          if (trailing != null) trailing
          else const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }*/




}
