// import 'package:flutter/material.dart';
// import '../../config/app_colors.dart';
// import '../../config/app_routes.dart';

// // Import màn hình Profile để hiển thị
// import '../profile/profile_screen.dart';
// import '../progress/progress_screen.dart';
// import '../lessons/lessons_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0; // 0: Home, 1: Progress, 2: Lessons, 3: Profile

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // --- PHẦN QUAN TRỌNG NHẤT: THAY ĐỔI BODY THEO TAB ---
//       body: SafeArea(
//         child: _buildBody(),
//       ),

//       // THANH MENU DƯỚI CÙNG
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: const Offset(0, -5),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.white,
//           selectedItemColor: AppColors.primary,
//           unselectedItemColor: Colors.grey[400],
//           selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//           unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
//           elevation: 0,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: "Progress"),
//             BottomNavigationBarItem(icon: Icon(Icons.school_rounded), label: "Lessons"),
//             BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- HÀM ĐIỀU HƯỚNG MÀN HÌNH ---
//   Widget _buildBody() {
//     switch (_selectedIndex) {
//       case 0:
//         return _buildHomeContent(context); // Tab Home
//       case 1:
//         return const ProgressScreen();
//       case 2:
//         return const LessonsScreen();
//       case 3:
//         return const ProfileScreen(); // Tab Profile (Chuyển sang file ProfileScreen)
//       default:
//         return _buildHomeContent(context);
//     }
//   }

//   // --- NỘI DUNG TRANG CHỦ (Tách ra từ code cũ) ---
//   Widget _buildHomeContent(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 1. HEADER
//           _buildHeader(),

//           const SizedBox(height: 24),

//           // 2. DAILY PROGRESS CARD
//           _buildDailyProgressCard(),

//           const SizedBox(height: 30),

//           // 3. LEARNING CATEGORIES
//           _buildSectionTitle("Learning Categories", action: Icons.grid_view_rounded),
//           const SizedBox(height: 16),

//           // Grid danh mục
//           _buildCategoriesGrid(context),

//           const SizedBox(height: 20),

//           // 4. RESOURCES CARD
//           _buildResourceCard(),

//           const SizedBox(height: 30),

//           // 5. RECENT ACTIVITY
//           _buildSectionTitle("Recent Activity"),
//           const SizedBox(height: 16),
//           _buildActivityList(),
//         ],
//       ),
//     );
//   }

//   // --- CÁC WIDGET CON (Giữ nguyên) ---

//   Widget _buildHeader() {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 24,
//           backgroundColor: Colors.grey[200],
//           backgroundImage: const AssetImage('assets/images/avatar_placeholder.png'),
//           onBackgroundImageError: (_, __) {},
//           child: const Icon(Icons.person, color: Colors.grey),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text(
//                 "Good morning!",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
//               ),
//               Text(
//                 "Ready to learn?",
//                 style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
//               ),
//             ],
//           ),
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: Stack(
//             children: [
//               const Icon(Icons.notifications_none_rounded, size: 28),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 10,
//                   height: 10,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white, width: 2),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.settings_outlined, size: 28),
//         ),
//       ],
//     );
//   }

//   Widget _buildDailyProgressCard() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: AppColors.cardProgressBg,
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Daily Progress",
//                   style: TextStyle(fontSize: 14, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 4),
//                 const Text(
//                   "4/7",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "Great job! Keep going to reach your goal.",
//                   style: TextStyle(fontSize: 13, color: AppColors.textSecondary.withOpacity(0.8), height: 1.4),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 16),
//           SizedBox(
//             width: 80,
//             height: 80,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 const CircularProgressIndicator(
//                   value: 0.57,
//                   strokeWidth: 8,
//                   backgroundColor: Colors.white,
//                   valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
//                 ),
//                 Center(
//                   child: const Text(
//                     "57%",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title, {IconData? action}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
//         ),
//         if (action != null)
//           Icon(action, color: Colors.grey[400], size: 24),
//       ],
//     );
//   }

//   Widget _buildCategoriesGrid(BuildContext context) {
//     final categories = [
//       {"icon": Icons.book_rounded, "name": "Vocabulary", "sub": "350 words", "color": AppColors.vocabColor, "bg": AppColors.vocabBg, "progress": 0.7},
//       {"icon": Icons.translate_rounded, "name": "Grammar", "sub": "12 lessons", "color": AppColors.grammarColor, "bg": AppColors.grammarBg, "progress": 0.4},
//       {"icon": Icons.headphones_rounded, "name": "Listening", "sub": "8 hours", "color": AppColors.listeningColor, "bg": AppColors.listeningBg, "progress": 0.6},
//       {"icon": Icons.mic_rounded, "name": "Speaking", "sub": "45 min", "color": AppColors.speakingColor, "bg": AppColors.speakingBg, "progress": 0.3},
//       {"icon": Icons.menu_book_rounded, "name": "Reading", "sub": "24 articles", "color": AppColors.readingColor, "bg": AppColors.readingBg, "progress": 0.8},
//       {"icon": Icons.edit_note_rounded, "name": "Writing", "sub": "6 essays", "color": AppColors.writingColor, "bg": AppColors.writingBg, "progress": 0.2},
//     ];

//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: categories.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         childAspectRatio: 0.85,
//       ),
//       itemBuilder: (context, index) {
//         final cat = categories[index];
//         return GestureDetector(
//           onTap: () {
//             final name = cat["name"];
//             if (name == "Vocabulary") {
//               Navigator.pushNamed(context, AppRoutes.vocabulary);
//             } else if (name == "Grammar") {
//               Navigator.pushNamed(context, AppRoutes.grammar);
//             } else if (name == "Listening") {
//               Navigator.pushNamed(context, AppRoutes.listening);
//             } else if (name == "Speaking") {
//               Navigator.pushNamed(context, AppRoutes.speaking);
//             } else if (name == "Reading") {
//               Navigator.pushNamed(context, AppRoutes.reading);
//             } else if (name == "Writing") {
//               Navigator.pushNamed(context, AppRoutes.writing);
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Coming soon: $name")),
//               );
//             }
//           },
//           child: _buildCategoryCard(
//             icon: cat["icon"] as IconData,
//             name: cat["name"] as String,
//             sub: cat["sub"] as String,
//             color: cat["color"] as Color,
//             bgColor: cat["bg"] as Color,
//             progress: cat["progress"] as double,
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildCategoryCard({
//     required IconData icon,
//     required String name,
//     required String sub,
//     required Color color,
//     required Color bgColor,
//     required double progress,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: bgColor.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.6),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, color: color, size: 28),
//           ),
//           const Spacer(),
//           Text(
//             name,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             sub,
//             style: TextStyle(fontSize: 13, color: AppColors.textSecondary.withOpacity(0.8)),
//           ),
//           const SizedBox(height: 12),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: LinearProgressIndicator(
//               value: progress,
//               backgroundColor: Colors.white,
//               color: color,
//               minHeight: 6,
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildResourceCard() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//       decoration: BoxDecoration(
//         color: AppColors.resourceBg,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: const Color(0xFFE57373).withOpacity(0.2),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(Icons.folder_copy_rounded, color: AppColors.resourceColor, size: 28),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   "Resources",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   "Dictionary, flashcards & more",
//                   style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
//                 ),
//               ],
//             ),
//           ),
//           const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
//         ],
//       ),
//     );
//   }

//   Widget _buildActivityList() {
//     return Column(
//       children: [
//         _buildActivityItem(
//           icon: Icons.check_circle_outline_rounded,
//           color: AppColors.primary,
//           bg: AppColors.vocabBg,
//           title: "Completed Vocabulary Quiz",
//           time: "2 hours ago",
//         ),
//         const SizedBox(height: 16),
//         _buildActivityItem(
//           icon: Icons.emoji_events_rounded,
//           color: AppColors.grammarColor,
//           bg: AppColors.grammarBg,
//           title: "Earned Grammar Badge",
//           time: "Yesterday",
//         ),
//       ],
//     );
//   }

//   Widget _buildActivityItem({
//     required IconData icon,
//     required Color color,
//     required Color bg,
//     required String title,
//     required String time,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[200]!),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: bg,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, color: color, size: 24),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   time,
//                   style: const TextStyle(fontSize: 13, color: Colors.grey),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';

// Import màn hình Profile để hiển thị
import '../profile/profile_screen.dart';
import '../progress/progress_screen.dart';
import '../lessons/lessons_screen.dart';
import '../chatbot/chat_screen.dart'; // ← THÊM IMPORT CHAT SCREEN

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0; // 0: Home, 1: Progress, 2: Lessons, 3: Profile
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Animation cho chat bubble
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --- PHẦN QUAN TRỌNG NHẤT: THAY ĐỔI BODY THEO TAB ---
      body: SafeArea(
        child: Stack(
          children: [
            _buildBody(),

            // ← THÊM CHAT BUBBLE (Chỉ hiển thị ở tab Home)
            if (_selectedIndex == 0) _buildChatBubble(),
          ],
        ),
      ),

      // THANH MENU DƯỚI CÙNG
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: "Progress",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_rounded),
              label: "Lessons",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  // --- CHAT BUBBLE NỔI ---
  Widget _buildChatBubble() {
    return Positioned(
      bottom: 24,
      right: 20,
      child: GestureDetector(
        onTap: () {
          // Mở màn hình chat
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatScreen()),
          );
        },
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, Color(0xFF1E88E5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.chat_bubble_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    // Badge thông báo (có thể thêm số lượng tin nhắn chưa đọc)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // --- HÀM ĐIỀU HƯỚNG MÀN HÌNH ---
  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent(context); // Tab Home
      case 1:
        return const ProgressScreen();
      case 2:
        return const LessonsScreen();
      case 3:
        return const ProfileScreen(); // Tab Profile (Chuyển sang file ProfileScreen)
      default:
        return _buildHomeContent(context);
    }
  }

  // --- NỘI DUNG TRANG CHỦ (Tách ra từ code cũ) ---
  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. HEADER
          _buildHeader(),

          const SizedBox(height: 24),

          // 2. AI ASSISTANT BANNER (THÊM MỚI)
          _buildAIAssistantBanner(),

          const SizedBox(height: 24),

          // 3. DAILY PROGRESS CARD
          _buildDailyProgressCard(),

          const SizedBox(height: 30),

          // 4. LEARNING CATEGORIES
          _buildSectionTitle(
            "Learning Categories",
            action: Icons.grid_view_rounded,
          ),
          const SizedBox(height: 16),

          // Grid danh mục
          _buildCategoriesGrid(context),

          const SizedBox(height: 20),

          // 5. RESOURCES CARD
          _buildResourceCard(),

          const SizedBox(height: 30),

          // 6. RECENT ACTIVITY
          _buildSectionTitle("Recent Activity"),
          const SizedBox(height: 16),
          _buildActivityList(),

          // Thêm khoảng trống để không bị che bởi chat bubble
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  // --- BANNER GIỚI THIỆU AI ASSISTANT (THÊM MỚI) ---
  Widget _buildAIAssistantBanner() {
    return GestureDetector(
      onTap: () {
        // Mở màn hình chat
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF667EEA).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon AI với hiệu ứng glow
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.smart_toy_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "AI Learning Assistant",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Ask me anything about English! 💬",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  // --- CÁC WIDGET CON (Giữ nguyên) ---

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[200],
          backgroundImage: const AssetImage(
            'assets/images/avatar_placeholder.png',
          ),
          onBackgroundImageError: (_, __) {},
          child: const Icon(Icons.person, color: Colors.grey),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Good morning!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                "Ready to learn?",
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Stack(
            children: [
              const Icon(Icons.notifications_none_rounded, size: 28),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined, size: 28),
        ),
      ],
    );
  }

  Widget _buildDailyProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardProgressBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Daily Progress",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "4/7",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Great job! Keep going to reach your goal.",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary.withOpacity(0.8),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const CircularProgressIndicator(
                  value: 0.57,
                  strokeWidth: 8,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
                Center(
                  child: const Text(
                    "57%",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {IconData? action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        if (action != null) Icon(action, color: Colors.grey[400], size: 24),
      ],
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    final categories = [
      {
        "icon": Icons.book_rounded,
        "name": "Vocabulary",
        "sub": "350 words",
        "color": AppColors.vocabColor,
        "bg": AppColors.vocabBg,
        "progress": 0.7,
      },
      {
        "icon": Icons.translate_rounded,
        "name": "Grammar",
        "sub": "12 lessons",
        "color": AppColors.grammarColor,
        "bg": AppColors.grammarBg,
        "progress": 0.4,
      },
      {
        "icon": Icons.headphones_rounded,
        "name": "Listening",
        "sub": "8 hours",
        "color": AppColors.listeningColor,
        "bg": AppColors.listeningBg,
        "progress": 0.6,
      },
      {
        "icon": Icons.mic_rounded,
        "name": "Speaking",
        "sub": "45 min",
        "color": AppColors.speakingColor,
        "bg": AppColors.speakingBg,
        "progress": 0.3,
      },
      {
        "icon": Icons.menu_book_rounded,
        "name": "Reading",
        "sub": "24 articles",
        "color": AppColors.readingColor,
        "bg": AppColors.readingBg,
        "progress": 0.8,
      },
      {
        "icon": Icons.edit_note_rounded,
        "name": "Writing",
        "sub": "6 essays",
        "color": AppColors.writingColor,
        "bg": AppColors.writingBg,
        "progress": 0.2,
      },
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return GestureDetector(
          onTap: () {
            final name = cat["name"];
            if (name == "Vocabulary") {
              Navigator.pushNamed(context, AppRoutes.vocabulary);
            } else if (name == "Grammar") {
              Navigator.pushNamed(context, AppRoutes.grammar);
            } else if (name == "Listening") {
              Navigator.pushNamed(context, AppRoutes.listening);
            } else if (name == "Speaking") {
              Navigator.pushNamed(context, AppRoutes.speaking);
            } else if (name == "Reading") {
              Navigator.pushNamed(context, AppRoutes.reading);
            } else if (name == "Writing") {
              Navigator.pushNamed(context, AppRoutes.writing);
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Coming soon: $name")));
            }
          },
          child: _buildCategoryCard(
            icon: cat["icon"] as IconData,
            name: cat["name"] as String,
            sub: cat["sub"] as String,
            color: cat["color"] as Color,
            bgColor: cat["bg"] as Color,
            progress: cat["progress"] as double,
          ),
        );
      },
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String name,
    required String sub,
    required Color color,
    required Color bgColor,
    required double progress,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const Spacer(),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white,
              color: color,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.resourceBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFE57373).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.folder_copy_rounded,
              color: AppColors.resourceColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Resources",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Dictionary, flashcards & more",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityList() {
    return Column(
      children: [
        _buildActivityItem(
          icon: Icons.check_circle_outline_rounded,
          color: AppColors.primary,
          bg: AppColors.vocabBg,
          title: "Completed Vocabulary Quiz",
          time: "2 hours ago",
        ),
        const SizedBox(height: 16),
        _buildActivityItem(
          icon: Icons.emoji_events_rounded,
          color: AppColors.grammarColor,
          bg: AppColors.grammarBg,
          title: "Earned Grammar Badge",
          time: "Yesterday",
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required Color color,
    required Color bg,
    required String title,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
