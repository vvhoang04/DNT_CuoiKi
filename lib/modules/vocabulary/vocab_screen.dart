import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class VocabScreen extends StatelessWidget {
  const VocabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. BANNER (Welcome back Sarah)
            _buildBanner(),

            const SizedBox(height: 30),

            // 2. CATEGORIES TITLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View all",
                    style: TextStyle(color: AppColors.primary, fontSize: 14),
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),

            // 3. CATEGORIES GRID
            _buildCategoriesGrid(),

            const SizedBox(height: 30),

            // 4. QUICK ACTIONS
            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildQuickActions(),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS CON ---

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.book_rounded, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 8),
          const Text(
            "VocabLearn",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, color: Colors.black),
              onPressed: () {},
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/avatar_placeholder.png'),
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF4B95FF), // Màu xanh sáng hơn chút cho banner
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4B95FF).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome back, Sarah!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Continue your learning journey",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.local_fire_department_rounded, color: Colors.orangeAccent, size: 20),
              const SizedBox(width: 6),
              const Text(
                "7 day streak",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "342 ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Words learned",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    // Dữ liệu mẫu khớp với ảnh
    final topics = [
      {"icon": Icons.restaurant_rounded, "name": "Food", "count": "48 words", "color": const Color(0xFFEF5350), "bg": const Color(0xFFFFEBEE), "progress": 0.67},
      {"icon": Icons.flight_rounded, "name": "Travel", "count": "36 words", "color": const Color(0xFF66BB6A), "bg": const Color(0xFFE8F5E9), "progress": 0.50},
      {"icon": Icons.school_rounded, "name": "School", "count": "52 words", "color": const Color(0xFFFFCA28), "bg": const Color(0xFFFFF8E1), "progress": 0.75},
      {"icon": Icons.home_rounded, "name": "Home", "count": "41 words", "color": const Color(0xFFAB47BC), "bg": const Color(0xFFF3E5F5), "progress": 0.33},
      {"icon": Icons.business_center_rounded, "name": "Business", "count": "29 words", "color": const Color(0xFF42A5F5), "bg": const Color(0xFFE3F2FD), "progress": 0.25},
      {"icon": Icons.favorite_rounded, "name": "Emotions", "count": "33 words", "color": const Color(0xFFEC407A), "bg": const Color(0xFFFCE4EC), "progress": 0.40},
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: topics.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75, // Tỷ lệ thẻ cao hơn chút để giống ảnh
      ),
      itemBuilder: (context, index) {
        final topic = topics[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: topic["bg"] as Color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(topic["icon"] as IconData, color: topic["color"] as Color, size: 24),
              ),
              const Spacer(),
              Text(
                topic["name"] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                topic["count"] as String,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: topic["progress"] as double,
                        backgroundColor: (topic["color"] as Color).withOpacity(0.1),
                        color: topic["color"] as Color,
                        minHeight: 6,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${((topic["progress"] as double) * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuickActions() {
    return Column(
      children: [
        // Nút xanh: Continue Learning
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4B95FF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              shadowColor: const Color(0xFF4B95FF).withOpacity(0.4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.play_arrow_rounded, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Continue Learning",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Nút trắng: Daily Review
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade200),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              backgroundColor: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.access_time_filled_rounded, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  "Daily Review",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
