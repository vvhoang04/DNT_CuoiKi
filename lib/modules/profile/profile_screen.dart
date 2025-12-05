import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Không cần AppBar vì sẽ dùng Header riêng đẹp hơn
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // 1. HEADER (Avatar + Info)
            const Center(
              child: Text(
                "My Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
            ),
            const SizedBox(height: 30),
            
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 4),
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/images/avatar_placeholder.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 16),
            const Text(
              "Sarah Williams",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 4),
            Text(
              "sarah.williams@email.com",
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary.withOpacity(0.8)),
            ),
            
            const SizedBox(height: 20),
            
            // Nút Edit Profile
            SizedBox(
              width: 140,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                ),
                child: const Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),

            const SizedBox(height: 40),

            // 2. MENU OPTIONS
            _buildSectionTitle("General"),
            const SizedBox(height: 10),
            _buildMenuOption(
              icon: Icons.person_outline_rounded,
              title: "Personal Data",
              color: Colors.blue,
            ),
            _buildMenuOption(
              icon: Icons.payment_rounded,
              title: "Payment",
              color: Colors.orange,
            ),
            _buildMenuOption(
              icon: Icons.notifications_none_rounded,
              title: "Notifications",
              color: Colors.purple,
              trailing: Switch(
                value: true, 
                onChanged: (val) {},
                activeColor: AppColors.primary,
              ),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle("Preferences"),
            const SizedBox(height: 10),
            _buildMenuOption(
              icon: Icons.language_rounded,
              title: "Language",
              color: Colors.teal,
              trailingText: "English (US)",
            ),
            _buildMenuOption(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              color: Colors.indigo,
              trailing: Switch(
                value: false, 
                onChanged: (val) {},
              ),
            ),
            _buildMenuOption(
              icon: Icons.help_outline_rounded,
              title: "Help Center",
              color: Colors.green,
            ),
            
            const SizedBox(height: 24),
            
            // Logout Button
            TextButton(
              onPressed: () {
                // Quay về màn hình Login
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required Color color,
    Widget? trailing,
    String? trailingText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: trailing ?? (trailingText != null 
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(trailingText, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
                ],
              )
            : const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey)),
        onTap: () {},
      ),
    );
  }
}