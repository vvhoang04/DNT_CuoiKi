// import 'package:flutter/material.dart';
// import '../../config/app_colors.dart';
// import '../../config/app_routes.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   // Biến để quản lý ẩn/hiện mật khẩu
//   bool _isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     // GestureDetector bọc ngoài cùng để ẩn bàn phím khi bấm ra ngoài
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         backgroundColor: AppColors.background,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),

//                 // --- 1. HEADER IMAGE ---
//                 // Dùng Image.asset gọn gàng
//                 Container(
//                 width: 150, // Kích thước hình tròn
//                 height: 150,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle, // Biến container thành hình tròn
//                   color: Colors.grey[200], // Màu nền tạm khi chưa có ảnh
//                   image: const DecorationImage(
//                     // Thay đường dẫn ảnh của bạn ở đây
//                     image: AssetImage('assets/images/login_illustration.png'),
//                     fit: BoxFit.cover, // Cắt ảnh cho vừa khít hình tròn
//                   ),
//                 ),
//               ),

//                 const SizedBox(height: 30),

//                 // --- 2. TITLE & SUBTITLE ---
//                 const Text(
//                   "Welcome Back!",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.textPrimary,
//                     letterSpacing: -0.5,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Continue your English learning journey",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: AppColors.textSecondary,
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 // --- 3. FORM INPUTS ---
//                 _buildLabel("Email"),
//                 const SizedBox(height: 8),
//                 _buildTextField(
//                   hintText: "Enter your email",
//                   icon: Icons.mail_outline_rounded,
//                 ),

//                 const SizedBox(height: 20),

//                 _buildLabel("Password"),
//                 const SizedBox(height: 8),
//                 _buildTextField(
//                   hintText: "Enter your password",
//                   isPassword: true,
//                   isVisible: _isPasswordVisible,
//                   onVisibilityToggle: () {
//                     setState(() {
//                       _isPasswordVisible = !_isPasswordVisible;
//                     });
//                   },
//                 ),

//                 // --- 4. FORGOT PASSWORD ---
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       "Forgot Password?",
//                       style: TextStyle(
//                         color: AppColors.primary,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 10),

//                 // --- 5. LOGIN BUTTON ---
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, AppRoutes.onboarding);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primary,
//                       elevation: 5,
//                       shadowColor: AppColors.primary.withOpacity(0.4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     child: const Text(
//                       "Login",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 // --- 6. OR CONTINUE WITH ---
//                 const Row(
//                   children: [
//                     Expanded(child: Divider(color: Color(0xFFEEEEEE), thickness: 2)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         "or continue with",
//                         style: TextStyle(color: Color(0xFF9E9E9E)),
//                       ),
//                     ),
//                     Expanded(child: Divider(color: Color(0xFFEEEEEE), thickness: 2)),
//                   ],
//                 ),

//                 const SizedBox(height: 30),

//                 // --- 7. SOCIAL BUTTONS ---
//                 // Đã sửa lại đúng cú pháp: Truyền đường dẫn String, không truyền Widget
//                 _buildSocialButton(
//                   text: "Continue with Google",
//                   imagePath: 'assets/images/icon_google.png',
//                 ),

//                 const SizedBox(height: 16),

//                 _buildSocialButton(
//                   text: "Continue with Facebook",
//                   imagePath: 'assets/images/icon_face.png',
//                 ),

//                 const SizedBox(height: 40),

//                 // --- 8. SIGN UP LINK ---
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Don't have an account? ",
//                       style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, AppRoutes.signUp);
//                       },
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           color: AppColors.primary,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- Helper Widgets ---

//   Widget _buildLabel(String text) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: AppColors.textPrimary,
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String hintText,
//     IconData? icon,
//     bool isPassword = false,
//     bool isVisible = false,
//     VoidCallback? onVisibilityToggle,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.inputBackground,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: TextField(
//         obscureText: isPassword && !isVisible,
//         style: const TextStyle(fontSize: 16, color: AppColors.textPrimary),
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(color: AppColors.inputHint),
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//           suffixIcon: isPassword
//               ? IconButton(
//                   icon: Icon(
//                     isVisible ? Icons.visibility : Icons.visibility_off_outlined,
//                     color: Colors.grey,
//                   ),
//                   onPressed: onVisibilityToggle,
//                 )
//               : Icon(icon, color: Colors.grey),
//         ),
//       ),
//     );
//   }

//   // Hàm đã được tối ưu để nhận đường dẫn ảnh
//   Widget _buildSocialButton({
//     required String text,
//     required String imagePath,
//   }) {
//     return Container(
//       width: double.infinity,
//       height: 56,
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.borderColor),
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//       ),
//       child: InkWell(
//         onTap: () {},
//         borderRadius: BorderRadius.circular(16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               height: 24,
//               width: 24,
//               // Thêm errorBuilder để tránh crash app nếu quên copy ảnh vào assets
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.error_outline, color: Colors.red),
//             ),
//             const SizedBox(width: 12),
//             Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.textPrimary,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Biến để quản lý ẩn/hiện mật khẩu
  bool _isPasswordVisible = false;

  // Controllers để lấy giá trị input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Biến loading khi đang xử lý login
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Hàm xử lý login
  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Validation cơ bản
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email and password'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Hiển thị loading
    setState(() {
      _isLoading = true;
    });

    // Giả lập API call (thay bằng API thật của bạn)
    await Future.delayed(const Duration(seconds: 2));

    // Tắt loading
    setState(() {
      _isLoading = false;
    });

    // Kiểm tra đăng nhập (demo: email bất kỳ + password >= 6 ký tự)
    if (password.length >= 6) {
      // ← THAY ĐỔI QUAN TRỌNG: Chuyển đến Home thay vì Onboarding
      Navigator.pushReplacementNamed(context, AppRoutes.home);

      // Hiển thị thông báo thành công
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful! 🎉'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Đăng nhập thất bại
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Invalid credentials. Password must be at least 6 characters.',
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector bọc ngoài cùng để ẩn bàn phím khi bấm ra ngoài
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // --- 1. HEADER IMAGE ---
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/login_illustration.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // --- 2. TITLE & SUBTITLE ---
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Continue your English learning journey",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 40),

                // --- 3. FORM INPUTS ---
                _buildLabel("Email"),
                const SizedBox(height: 8),
                _buildTextField(
                  controller: _emailController,
                  hintText: "Enter your email",
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                _buildLabel("Password"),
                const SizedBox(height: 8),
                _buildTextField(
                  controller: _passwordController,
                  hintText: "Enter your password",
                  isPassword: true,
                  isVisible: _isPasswordVisible,
                  onVisibilityToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),

                // --- 4. FORGOT PASSWORD ---
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Forgot Password feature coming soon'),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // --- 5. LOGIN BUTTON ---
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : _handleLogin, // Disable khi loading
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 5,
                      shadowColor: AppColors.primary.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      disabledBackgroundColor: AppColors.primary.withOpacity(
                        0.6,
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 30),

                // --- 6. OR CONTINUE WITH ---
                const Row(
                  children: [
                    Expanded(
                      child: Divider(color: Color(0xFFEEEEEE), thickness: 2),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or continue with",
                        style: TextStyle(color: Color(0xFF9E9E9E)),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xFFEEEEEE), thickness: 2),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // --- 7. SOCIAL BUTTONS ---
                _buildSocialButton(
                  text: "Continue with Google",
                  imagePath: 'assets/images/icon_google.png',
                  onTap: () {
                    // TODO: Implement Google Sign In
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Google Sign In coming soon'),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                _buildSocialButton(
                  text: "Continue with Facebook",
                  imagePath: 'assets/images/icon_face.png',
                  onTap: () {
                    // TODO: Implement Facebook Sign In
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Facebook Sign In coming soon'),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),

                // --- 8. SIGN UP LINK ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: const Text(
                        "Sign Up",
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
      ),
    );
  }

  // --- Helper Widgets ---

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
    TextEditingController? controller,
    IconData? icon,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onVisibilityToggle,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isVisible,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 16, color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.inputHint),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isVisible
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
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
    required String imagePath,
    VoidCallback? onTap,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 24,
              width: 24,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error_outline, color: Colors.red),
            ),
            const SizedBox(width: 12),
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
