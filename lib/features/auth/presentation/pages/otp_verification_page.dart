import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_widgets.dart';
import 'identity_verification_page.dart';
import 'passcode_page.dart';
import 'security_questions_page.dart';

class OtpVerificationPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? phoneNumber;
  final int currentStep;
  final int nextStep;

  const OtpVerificationPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.phoneNumber,
    required this.currentStep,
    required this.nextStep,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _pinController = TextEditingController();
  late Timer _timer;
  int _start = 119; // 1:59

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get _timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    _pinController.dispose();
    super.dispose();
  }

  void _onComplete(String pin) {
    if (widget.nextStep == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const IdentityVerificationPage(),
        ),
      );
    } else if (widget.nextStep == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasscodePage(
            title: 'Set Passcode',
            subtitle: 'Secure your account with a 4-digit passcode',
            onComplete: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasscodePage(
                    title: 'Confirm Passcode',
                    subtitle: 'Please re-enter your 4-digit passcode',
                    onComplete: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasscodePage(
                            title: 'Set Transaction PIN',
                            subtitle: 'This will be used for all your transactions',
                            isTransactionPin: true,
                            onComplete: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PasscodePage(
                                    title: 'Confirm Transaction PIN',
                                    subtitle: 'Please re-enter your transaction PIN',
                                    isTransactionPin: true,
                                    onComplete: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SecurityQuestionsPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 60.h,
      textStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.deepBlue,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(
                      title: widget.title,
                      subtitle: widget.subtitle,
                      currentStep: widget.currentStep,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32.h),
                          if (widget.phoneNumber != null)
                            Text(
                              'We sent a 6 digit code to ${widget.phoneNumber!.replaceRange(3, 8, '*****')}',
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                color: AppColors.gray,
                              ),
                            ),
                          SizedBox(height: 24.h),
                          Center(
                            child: Pinput(
                              length: 6,
                              controller: _pinController,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!.copyWith(
                                  border: Border.all(color: AppColors.primaryBlue),
                                ),
                              ),
                              onCompleted: _onComplete,
                              separatorBuilder: (index) => SizedBox(width: 8.w),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    color: AppColors.gray,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Code expires in: '),
                                    TextSpan(
                                      text: _timerText,
                                      style: GoogleFonts.inter(
                                        color: AppColors.primaryBlue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: _start == 0 ? () {
                                  setState(() {
                                    _start = 119;
                                    _startTimer();
                                  });
                                } : null,
                                child: Text(
                                  'Resend code',
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    color: _start == 0 ? AppColors.primaryBlue : AppColors.gray,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
