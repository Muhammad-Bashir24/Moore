import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/validation_utils.dart';
import '../widgets/auth_widgets.dart';
import 'otp_verification_page.dart';

class IdentityVerificationPage extends StatefulWidget {
  const IdentityVerificationPage({super.key});

  @override
  State<IdentityVerificationPage> createState() =>
      _IdentityVerificationPageState();
}

class _IdentityVerificationPageState extends State<IdentityVerificationPage> {
  bool isBvnSelected = true;
  final _idController = TextEditingController();
  final _dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _idController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(
        const Duration(days: 6570),
      ), // 18 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  void _onProceed() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(
            title: isBvnSelected ? 'Verify BVN' : 'Verify NIN',
            subtitle:
                'Verify the phone number linked to your ${isBvnSelected ? 'BVN' : 'NIN'}',
            currentStep: 4,
            nextStep: 5,
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
                      title: 'Verify BVN / NIN',
                      subtitle: 'Welcome to Moore, let\'s get started!',
                      currentStep: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          Text(
                            'To sign up, enter your BVN or NIN for secure and faster transactions. Your data is safe with us and only used for verification.',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.gray,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              IdentityOption(
                                title: 'BVN',
                                subtitle: 'Bank Verification Number',
                                iconPath: 'assets/images/bvcnoicon.png',
                                isSelected: isBvnSelected,
                                onTap: () =>
                                    setState(() => isBvnSelected = true),
                              ),
                              SizedBox(width: 16.w),
                              IdentityOption(
                                title: 'NIN',
                                subtitle: 'National Identification Number',
                                iconPath: 'assets/images/ninnoicon.png',
                                isSelected: !isBvnSelected,
                                onTap: () =>
                                    setState(() => isBvnSelected = false),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'To get your 11 digits ${isBvnSelected ? 'BVN dial *565*0#' : 'NIN dial *346#'} on your registered SIM.',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.gray,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          AuthTextField(
                            label: isBvnSelected
                                ? 'BVN'
                                : 'National Identification Number',
                            hintText: 'eg. 22154871260',
                            controller: _idController,
                            validator: isBvnSelected
                                ? ValidationUtils.validateBVN
                                : ValidationUtils.validateNIN,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 20.h),
                          AuthTextField(
                            label: 'Date of birth',
                            hintText: 'MM/DD/YYYY',
                            controller: _dobController,
                            validator: ValidationUtils.validateDOB,
                            readOnly: true,
                            onTap: _selectDate,
                            suffixIcon: const Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.gray,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F4F7),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  width: 40.h,
                                  'assets/images/bonusimage.png',
                                  height: 40.h,
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sign up to get 10% Bonus on your first deposit.',
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.deepBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                  onPressed: () {},
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
