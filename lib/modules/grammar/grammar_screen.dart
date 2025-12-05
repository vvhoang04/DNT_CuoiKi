import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

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
            // 1. PROGRESS CARD
            _buildProgressCard(),

            const SizedBox(height: 30),

            // 2. TITLE
            const Text(
              "All Topics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // 3. TOPICS LIST
            _buildTopicsList(),
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
      title: const Text(
        "Grammar Topics",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Xanh dương rất nhạt
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Your Progress",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
              ),
              Text(
                "12/24 completed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.5, // 50%
              backgroundColor: Colors.white,
              color: AppColors.primary,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicsList() {
    // Dữ liệu giả lập khớp với ảnh
    final topics = [
      {
        "title": "Tenses",
        "sub": "Past, Present & Future",
        "icon": Icons.access_time_filled_rounded,
        "color": const Color(0xFF42A5F5), // Blue
        "bg": const Color(0xFFE3F2FD),
        "status": "completed"
      },
      {
        "title": "Passive Voice",
        "sub": "Active to Passive",
        "icon": Icons.swap_horiz_rounded,
        "color": const Color(0xFFAB47BC), // Purple
        "bg": const Color(0xFFF3E5F5),
        "status": "progress",
        "progressStr": "3/5"
      },
      {
        "title": "Conditionals",
        "sub": "If clauses & Types",
        "icon": Icons.help_outline_rounded,
        "color": const Color(0xFFFFCA28), // Orange
        "bg": const Color(0xFFFFF8E1),
        "status": "locked"
      },
      {
        "title": "Modal Verbs",
        "sub": "Can, Could, Should",
        "icon": Icons.chat_bubble_outline_rounded,
        "color": const Color(0xFF66BB6A), // Green
        "bg": const Color(0xFFE8F5E9),
        "status": "completed"
      },
      {
        "title": "Reported Speech",
        "sub": "Direct & Indirect",
        "icon": Icons.format_quote_rounded,
        "color": const Color(0xFFEF5350), // Red
        "bg": const Color(0xFFFFEBEE),
        "status": "progress",
        "progressStr": "1/4"
      },
      {
        "title": "Articles",
        "sub": "A, An, The",
        "icon": Icons.text_fields_rounded,
        "color": const Color(0xFF5C6BC0), // Indigo
        "bg": const Color(0xFFE8EAF6),
        "status": "completed"
      },
      {
        "title": "Prepositions",
        "sub": "In, On, At, By",
        "icon": Icons.near_me_rounded,
        "color": const Color(0xFF26A69A), // Teal
        "bg": const Color(0xFFE0F2F1),
        "status": "locked"
      },
    ];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: topics.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final topic = topics[index];
        return _buildTopicItem(topic);
      },
    );
  }

  Widget _buildTopicItem(Map<String, dynamic> topic) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          // Icon Box
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: topic['bg'],
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(topic['icon'], color: topic['color'], size: 26),
          ),
          const SizedBox(width: 16),
          
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  topic['sub'],
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Status Icon (Logic hiển thị trạng thái)
          if (topic['status'] == 'completed')
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50), // Green
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 14),
            )
          else if (topic['status'] == 'progress')
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                topic['progressStr'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            )
          else if (topic['status'] == 'locked')
            const Icon(Icons.lock_rounded, color: Colors.grey, size: 22),

          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
