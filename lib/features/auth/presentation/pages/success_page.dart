import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moore/features/dashboard/presentation/pages/dashboard_page.dart';
import '../../../../core/theme/app_colors.dart';

class SuccessPage extends StatefulWidget {
  final int step; // 1 for Fund Account, 2 for Next Steps

  const SuccessPage({super.key, required this.step});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  late int _currentStep;

  @override
  void initState() {
    super.initState();
    _currentStep = widget.step;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Image.asset('assets/images/logo1.png', height: 24.h),
                      SizedBox(height: 32.h),
                      Text(
                        'Welcome to Moore!',
                        style: GoogleFonts.inter(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.deepBlue,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Your account is ready',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: AppColors.gray,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Image.asset(
                        'assets/images/welcometmooreimage.png',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 32.h),
                      if (_currentStep == 1)
                        _buildFundAccount()
                      else
                        _buildNextSteps(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_currentStep == 1) {
                        setState(() {
                          _currentStep = 2;
                        });
                      } else {
                        // Navigate to Dashboard
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      _currentStep == 1 ? 'Continue' : 'Continue to Dashboard',
                    ),
                  ),
                  if (_currentStep == 2) ...[
                    SizedBox(height: 8.h),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Upgrade Account',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFundAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How to Fund Your Account',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.deepBlue,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'To deposit money into your MOORE wallet, transfer funds using the details above from any Nigerian bank or fintech app.',
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: AppColors.gray,
            height: 1.5,
          ),
        ),
        SizedBox(height: 24.h),
        _buildDetailItem(
          label: 'Destination Bank',
          value: 'Xpresswallet',
          icon: Image.asset('assets/images/bankicon.png', height: 24.h),
        ),
        SizedBox(height: 16.h),
        _buildDetailItem(
          label: 'Account number',
          value: '009 352 2625',
          showCopy: true,
        ),
        SizedBox(height: 16.h),
        _buildDetailItem(
          label: 'Account Name',
          value: 'Oluwatobi Olowu',
          icon: Icon(
            Icons.person_outline,
            color: AppColors.primaryBlue,
            size: 24.sp,
          ),
        ),
        SizedBox(height: 24.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F4F7),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, color: AppColors.deepBlue, size: 20.sp),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'You can see this account details by clicking the "Add money" button in the dashboard and selecting "Fund with Other Banks".',
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: AppColors.deepBlue,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required String label,
    required String value,
    Widget? icon,
    bool showCopy = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF2F4F7)),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            icon,
            SizedBox(width: 12.w),
          ] else ...[
            Container(
              width: 32.w,
              height: 32.w,
              decoration: const BoxDecoration(
                color: Color(0xFFE0E7FF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '123',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.deepBlue,
                  ),
                ),
              ],
            ),
          ),
          if (showCopy)
            TextButton(
              onPressed: () {
                Clipboard.setData(const ClipboardData(text: '0093522625'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account number copied!')),
                );
              },
              child: Row(
                children: [
                  Text(
                    'Copy',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.copy, size: 14.sp, color: AppColors.primaryBlue),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNextSteps() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Next Steps',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.deepBlue,
          ),
        ),
        SizedBox(height: 20.h),
        _buildBenefitItem('Start making payments & transfers.'),
        _buildBenefitItem('Buy airtime, data, and pay bills.'),
        _buildBenefitItem(
          'Enjoy amazing cashback on your airtime, data, power purchase and other bills.',
        ),
        SizedBox(height: 24.h),
        Text(
          'If you have any questions, contact MOORE Support via in-app chat and Whatsapp messages 2348148418003.',
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: AppColors.gray,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4.h),
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: AppColors.gray,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
