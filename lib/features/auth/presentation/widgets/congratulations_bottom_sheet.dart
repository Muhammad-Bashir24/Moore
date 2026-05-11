import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class CongratulationsBottomSheet extends StatelessWidget {
  final VoidCallback onLogin;

  const CongratulationsBottomSheet({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 32.h),
          Image.asset(
            'assets/images/congratulationimage.png',
            height: 200.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 24.h),
          Text(
            'Congratulations',
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "You're 3 steps away from completing your profile. Would you like to complete the sign up process?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.gray,
              height: 1.5,
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(onPressed: onLogin, child: const Text('Login')),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
