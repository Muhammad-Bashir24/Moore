import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moore/core/theme/app_colors.dart';
import 'package:pinput/pinput.dart';

class PrimaryDeviceBottomSheet extends StatelessWidget {
  final VoidCallback onProceed;
  final VoidCallback onNotNow;

  const PrimaryDeviceBottomSheet({
    super.key,
    required this.onProceed,
    required this.onNotNow,
  });

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
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.smartphone_outlined,
              size: 40.sp,
              color: AppColors.primaryBlue,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Use as Primary Device',
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Do you want to Setup New Device as your Primary Device?',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.gray,
              height: 1.5,
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: onProceed,
            child: const Text('Proceed'),
          ),
          SizedBox(height: 16.h),
          TextButton(
            onPressed: onNotNow,
            child: Text(
              'Not Now',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class DeviceLinkedBottomSheet extends StatelessWidget {
  final VoidCallback onProceed;

  const DeviceLinkedBottomSheet({super.key, required this.onProceed});

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
            'assets/images/congratulationimage.png', // Reusing the balloons image
            height: 120.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 24.h),
          Text(
            'Device Linked Successfully',
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'This device has been set as your primary device',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.gray,
              height: 1.5,
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: onProceed,
            child: const Text('Proceed'),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class VerifyOtpBottomSheet extends StatefulWidget {
  final String phoneNumber;
  final VoidCallback onProceed;

  const VerifyOtpBottomSheet({
    super.key,
    required this.phoneNumber,
    required this.onProceed,
  });

  @override
  State<VerifyOtpBottomSheet> createState() => _VerifyOtpBottomSheetState();
}

class _VerifyOtpBottomSheetState extends State<VerifyOtpBottomSheet> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.w,
      textStyle: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.deepBlue,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24.w, 24.w, 24.w, MediaQuery.of(context).viewInsets.bottom + 24.w),
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
          SizedBox(height: 24.h),
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock_outline,
              size: 30.sp,
              color: AppColors.primaryBlue,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Verify OTP',
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'We sent a 4 digit code to ${widget.phoneNumber}',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: AppColors.gray,
            ),
          ),
          SizedBox(height: 24.h),
          Pinput(
            length: 4,
            controller: _pinController,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: AppColors.primaryBlue),
              ),
            ),
            onCompleted: (pin) => widget.onProceed(),
            separatorBuilder: (index) => SizedBox(width: 8.w),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Code expires in: 02:59',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.gray,
                ),
              ),
              Text(
                'Resend code',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: widget.onProceed,
            child: const Text('Proceed'),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class DeviceBindingFailedBottomSheet extends StatelessWidget {
  final VoidCallback onTryAgain;
  final VoidCallback onClose;

  const DeviceBindingFailedBottomSheet({
    super.key,
    required this.onTryAgain,
    required this.onClose,
  });

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
          Text(
            '☹️',
            style: TextStyle(fontSize: 60.sp),
          ),
          SizedBox(height: 24.h),
          Text(
            'Device Binding Failed',
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: onTryAgain,
            child: const Text('Try Again'),
          ),
          SizedBox(height: 12.h),
          OutlinedButton(
            onPressed: onClose,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primaryBlue),
              foregroundColor: AppColors.primaryBlue,
            ),
            child: const Text('Close'),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class BiometricsBottomSheet extends StatelessWidget {
  final VoidCallback onActivate;
  final VoidCallback onNotNow;

  const BiometricsBottomSheet({
    super.key,
    required this.onActivate,
    required this.onNotNow,
  });

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
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fingerprint,
              size: 40.sp,
              color: AppColors.primaryBlue,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Activate Biometrics',
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Secure your account for safer and faster login',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.gray,
              height: 1.5,
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: onActivate,
            child: const Text('Activate Biometrics'),
          ),
          SizedBox(height: 16.h),
          TextButton(
            onPressed: onNotNow,
            child: Text(
              'Not Now',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
