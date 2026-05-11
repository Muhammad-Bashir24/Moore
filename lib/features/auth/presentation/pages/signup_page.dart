import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/validation_utils.dart';
import '../widgets/auth_widgets.dart';
import 'login_page.dart';
import 'otp_verification_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showTermsModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.all(24.w),
        child: Column(
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
            Text(
              'Terms & Conditions',
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.deepBlue,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar libero id orci blandit, ut mattis leo cursus. Integer nec lacus vel purus ultricies interdum. Sed viverra lacinia magna, eget euismod sapiente potenti. Vivamus diam a dui varius, a accumsan purus bibendum. Suspendisse potenti. Vivamus vitae ultricies nisl. Sed nec orci arcu cursus euismod ac a velit. Sed vitae augue sit amet nunc faucibus bibendum. Suspendisse potenti. Cras ac justo malesuada, fermentum justo a, pulvinar elit. Integer sed arcu id ante elementum vehicula. Vivamus vitae mauris a elit.',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: AppColors.gray,
                    height: 1.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onProceed() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(
            title: 'Verify Phone Number',
            subtitle: 'Verify the phone number linked to your BVN',
            phoneNumber: _phoneController.text,
            currentStep: 2,
            nextStep: 3,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthHeader(
                      title: 'Sign Up',
                      subtitle: 'Welcome to Moore, let\'s get started!',
                      currentStep: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32.h),
                          Text(
                            'Create your account',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.deepBlue,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          AuthTextField(
                            label: 'Email Address',
                            hintText: 'Enter Email Address',
                            controller: _emailController,
                            validator: ValidationUtils.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20.h),
                          AuthTextField(
                            label: 'Phone Number',
                            hintText: 'eg. 7032596254',
                            controller: _phoneController,
                            validator: ValidationUtils.validatePhone,
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
                          SizedBox(height: 24.h),
                          GestureDetector(
                            onTap: _showTermsModal,
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  color: AppColors.gray,
                                ),
                                children: [
                                  const TextSpan(
                                    text:
                                        'By proceeding you agree to Moore\'s ',
                                  ),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: GoogleFonts.inter(
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: GoogleFonts.inter(
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  onPressed: _onProceed,
                  child: const Text('Proceed'),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'I already have an account',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
