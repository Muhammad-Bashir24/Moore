import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moore/core/theme/app_colors.dart';
import 'package:moore/features/auth/presentation/pages/passcode_page.dart';
import 'package:moore/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:moore/features/auth/presentation/widgets/login_modals.dart';
import 'package:moore/features/dashboard/presentation/pages/dashboard_page.dart';

class WelcomeBackLoginPage extends StatefulWidget {
  final String phoneNumber;

  const WelcomeBackLoginPage({super.key, required this.phoneNumber});

  @override
  State<WelcomeBackLoginPage> createState() => _WelcomeBackLoginPageState();
}

class _WelcomeBackLoginPageState extends State<WelcomeBackLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both username and password'),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PrimaryDeviceBottomSheet(
        onProceed: () {
          Navigator.pop(context);
          _showOtpVerification();
        },
        onNotNow: () {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasscodePage(
                title: 'Enter Passcode',
                subtitle: 'Enter your 6-digit passcode',
                onComplete: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DashboardPage(showDeviceLinkedSuccess: true),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showOtpVerification() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => VerifyOtpBottomSheet(
        phoneNumber: widget.phoneNumber,
        onProceed: () {
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const DashboardPage(showDeviceLinkedSuccess: true),
            ),
            (route) => false,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AuthHeader(
            title: 'Welcome Back',
            subtitle: 'Login to continue',
            currentStep: 1,
            totalSteps: 4,
            showStep: false,
            showProgress: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  AuthTextField(
                    label: 'Username',
                    hintText: 'Enter your username',
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 24.h),
                  AuthTextField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.gray,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'You will be asked to confirm this device as your primary device after login.',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.gray,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
