import 'package:flutter/material.dart';
import 'config/app_colors.dart';
import 'config/app_routes.dart';

// --- IMPORT CÁC MÀN HÌNH ---
// Nếu thiếu các dòng này, code sẽ báo lỗi "isn't defined"
import 'modules/auth/login_screen.dart';
import 'modules/auth/signup_screen.dart';
import 'modules/onboarding/onboarding_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/vocabulary/vocab_screen.dart';
import 'modules/grammar/grammar_screen.dart';
import 'modules/listening/listening_screen.dart';
import 'modules/speaking/speaking_screen.dart';
import 'modules/reading/reading_screen.dart';
import 'modules/writing/writing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Learning App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),

      // ← THAY ĐỔI QUAN TRỌNG: Chạy Onboarding đầu tiên
      initialRoute: AppRoutes.grammar, // Thay vì AppRoutes.login

      routes: {
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.signUp: (context) => SignUpScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.vocabulary: (context) => const VocabScreen(),
        AppRoutes.grammar: (context) => const GrammarTopicsScreen(),
        AppRoutes.listening: (context) => const ListeningScreen(),
        AppRoutes.speaking: (context) => const SpeakingScreen(),
        AppRoutes.reading: (context) => const ReadingScreen(),
        AppRoutes.writing: (context) => const WritingScreen(),
      },
    );
  }
}
