import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              
              // --- 1. HEADER IMAGE (HÌNH TRÒN) ---
              Container(
                width: 150, // Kích thước hình tròn
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Biến container thành hình tròn
                  color: Colors.grey[200], // Màu nền tạm khi chưa có ảnh
                  image: const DecorationImage(
                    // Thay đường dẫn ảnh của bạn ở đây
                    image: AssetImage('assets/images/login_illustration.png'), 
                    fit: BoxFit.cover, // Cắt ảnh cho vừa khít hình tròn
                  ),
                ),
              ),
              
              const SizedBox(height: 20),

              // --- 2. TITLE ---
              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sign up to get started!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 30),

              // --- 3. FORM INPUTS ---
              
              // Thêm ô nhập Full Name
              _buildLabel("Full Name"),
              const SizedBox(height: 8),
              _buildTextField(
                hintText: "Enter your full name",
                icon: Icons.person_outline_rounded,
              ),
              
              const SizedBox(height: 16),

              _buildLabel("Email"),
              const SizedBox(height: 8),
              _buildTextField(
                hintText: "Enter your email",
                icon: Icons.mail_outline_rounded,
              ),

              const SizedBox(height: 16),

              _buildLabel("Password"),
              const SizedBox(height: 8),
              _buildTextField(
                hintText: "Create a password",
                isPassword: true,
                isVisible: _isPasswordVisible,
                onVisibilityToggle: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),

              const SizedBox(height: 30),

              // --- 4. SIGN UP BUTTON ---
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Đăng ký thành công thì vào Home
                    Navigator.pushNamedAndRemoveUntil(
                      context, 
                      AppRoutes.home, 
                      (route) => false // Xóa hết lịch sử back để không quay lại login
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 5,
                    shadowColor: AppColors.primary.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // --- 5. OR CONTINUE WITH ---
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xFFEEEEEE), thickness: 2)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("or sign up with", style: TextStyle(color: Color(0xFF9E9E9E))),
                  ),
                  Expanded(child: Divider(color: Color(0xFFEEEEEE), thickness: 2)),
                ],
              ),

              const SizedBox(height: 24),

              // --- 6. SOCIAL BUTTONS ---
              Row(
                children: [
                  Expanded(
                    child: _buildSocialButton(
                      text: "Google",
                      icon: Icons.g_mobiledata,
                      iconColor: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSocialButton(
                      text: "Facebook",
                      icon: Icons.facebook,
                      iconColor: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // --- 7. BACK TO LOGIN ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Quay lại màn hình Login
                      Navigator.pop(context); 
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets (Giống hệt bên Login để đồng bộ) ---

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    IconData? icon,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onVisibilityToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: isPassword && !isVisible,
        style: const TextStyle(fontSize: 16, color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.inputHint),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: onVisibilityToggle,
                )
              : Icon(icon, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String text,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}