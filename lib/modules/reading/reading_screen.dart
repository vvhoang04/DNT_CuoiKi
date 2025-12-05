import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

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
            // 1. FEATURED CARD
            _buildFeaturedCard(),

            const SizedBox(height: 30),

            // 2. TOPICS CHIPS
            const Text(
              "Topics",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("All", true),
                  _buildFilterChip("Stories", false),
                  _buildFilterChip("News", false),
                  _buildFilterChip("Science", false),
                  _buildFilterChip("Culture", false),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 3. ARTICLES LIST TITLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Latest Articles",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(color: AppColors.readingColor),
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),

            // 4. ARTICLES LIST
            _buildArticlesList(),
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
        "Reading Practice",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.bookmark_border_rounded, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFeaturedCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF9800), Color(0xFFFFB74D)], // Cam Gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF9800).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Daily Pick",
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "The Future of\nSpace Travel",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Explore how humanity is preparing for life beyond Earth.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.access_time_filled_rounded, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              const Text("5 min read", style: TextStyle(color: Colors.white, fontSize: 12)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.readingColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  minimumSize: const Size(0, 36),
                ),
                child: const Text("Read Now", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: FilterChip(
        label: Text(label),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppColors.textSecondary,
          fontWeight: FontWeight.w600,
        ),
        selected: isSelected,
        onSelected: (bool value) {},
        backgroundColor: AppColors.background,
        selectedColor: AppColors.readingColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.transparent : Colors.grey.shade200,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        showCheckmark: false,
      ),
    );
  }

  Widget _buildArticlesList() {
    final articles = [
      {
        "title": "Healthy Habits",
        "category": "Lifestyle",
        "time": "3 min",
        "level": "Easy",
        "image": Icons.favorite_rounded,
        "color": Colors.redAccent
      },
      {
        "title": "Modern History",
        "category": "History",
        "time": "7 min",
        "level": "Medium",
        "image": Icons.history_edu_rounded,
        "color": Colors.brown
      },
      {
        "title": "Digital Art",
        "category": "Art",
        "time": "4 min",
        "level": "Easy",
        "image": Icons.brush_rounded,
        "color": Colors.purpleAccent
      },
      {
        "title": "Ocean Life",
        "category": "Nature",
        "time": "6 min",
        "level": "Medium",
        "image": Icons.water_drop_rounded,
        "color": Colors.blueAccent
      },
      {
        "title": "Tech Trends 2024",
        "category": "Technology",
        "time": "10 min",
        "level": "Hard",
        "image": Icons.computer_rounded,
        "color": Colors.indigo
      },
    ];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: articles.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _buildArticleItem(articles[index]);
      },
    );
  }

  Widget _buildArticleItem(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: (item['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item['image'], color: item['color'], size: 30),
          ),
          const SizedBox(width: 16),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item['category'],
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.readingColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item['level'],
                        style: TextStyle(fontSize: 10, color: Colors.grey[600], fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 14, color: Colors.grey[400]),
                    const SizedBox(width: 4),
                    Text(
                      item['time'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
