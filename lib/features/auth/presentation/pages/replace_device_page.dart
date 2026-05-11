import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moore/core/theme/app_colors.dart';
import 'package:moore/features/auth/presentation/widgets/auth_widgets.dart';
import 'answer_security_question_page.dart';

class ReplaceDevicePage extends StatefulWidget {
  final String name;
  final String phoneNumber;

  const ReplaceDevicePage({
    super.key,
    required this.name,
    required this.phoneNumber,
  });

  @override
  State<ReplaceDevicePage> createState() => _ReplaceDevicePageState();
}

class _ReplaceDevicePageState extends State<ReplaceDevicePage> {
  String? _selectedDevice;

  final List<Map<String, String>> _devices = [
    {'name': 'iPhone 14 Pro Max', 'id': 'device1'},
    {'name': 'Samsung Galaxy Note 20', 'id': 'device2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AuthHeader(
            title: 'Welcome Back, ${widget.name}!',
            subtitle: 'Replace an existing device',
            currentStep: 1, // Simplified for this screen
            showProgress: false,
            showStep: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._devices.map((device) => _buildDeviceItem(device)),
                  SizedBox(height: 32.h),
                  Text(
                    'Simply follow the prompts to register this device and enjoy seamless access to your account.',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.gray,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: ElevatedButton(
              onPressed: _selectedDevice != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnswerSecurityQuestionPage(
                            phoneNumber: widget.phoneNumber,
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text('Replace Device'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceItem(Map<String, String> device) {
    bool isSelected = _selectedDevice == device['id'];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDevice = device['id'];
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : AppColors.lightGray,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                device['name']!.contains('iPhone')
                    ? Icons.apple
                    : Icons.android,
                color: AppColors.primaryBlue,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device['name']!,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepBlue,
                    ),
                  ),
                  Text(
                    'Existing device',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryBlue
                      : AppColors.lightGray,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
