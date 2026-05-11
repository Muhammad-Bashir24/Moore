import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moore/core/theme/app_colors.dart';
import 'package:moore/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:moore/features/auth/presentation/pages/signup_page.dart';
import 'package:moore/features/auth/presentation/pages/replace_device_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your phone number')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReplaceDevicePage(
          name: 'Tomike',
          phoneNumber: _phoneController.text,
        ),
      ),
    );
  }

  // void _showOtpVerification() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => VerifyOtpBottomSheet(
  //       phoneNumber: '+234 ${_phoneController.text}',
  //       onProceed: () {
  //         Navigator.pop(context);
  //         // Navigate to Dashboard and show success modal there
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>
  //                 const DashboardPage(showDeviceLinkedSuccess: true),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // void _showLinkedSuccess() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => DeviceLinkedBottomSheet(
  //       onProceed: () {
  //         Navigator.pop(context);
  //         // Finally navigate to Passcode
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => PasscodePage(
  //               title: 'Set Passcode',
  //               subtitle: 'Enter your 4-digit passcode',
  //               onComplete: () {
  //                 // Navigate to Dashboard or home
  //                 Navigator.of(context).popUntil((route) => route.isFirst);
  //               },
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue Background Header
          Container(
            height: 300.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Image.asset('assets/images/logo2.png', height: 24.h),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'Welcome Back!',
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Log in to continue',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // White Form Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height - 240.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          AuthTextField(
                            label: 'Phone Number',
                            hintText: 'eg. 7032536354',
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            prefix: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Text(
                                '234| ',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: AppColors.deepBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          ElevatedButton(
                            onPressed: _handleLogin,
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          "I don't have an account",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          // Support Icon (Headset)
          Positioned(
            bottom: 40.h,
            right: 24.w,
            child: Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.headset_mic_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
