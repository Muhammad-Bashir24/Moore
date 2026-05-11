import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_widgets.dart';

class PasscodePage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? passcode;
  final bool isTransactionPin;
  final VoidCallback onComplete;

  const PasscodePage({
    super.key,
    required this.title,
    required this.subtitle,
    this.passcode,
    this.isTransactionPin = false,
    required this.onComplete,
  });

  @override
  State<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  String _enteredPin = '';

  // Select the correct image based on the page type
  String get _iconAsset {
    return widget.isTransactionPin
        ? 'assets/images/transactionpinicon.png'
        : 'assets/images/keylock.png';
  }

  void _onDigitTap(String digit) {
    if (_enteredPin.length < 6) {
      setState(() {
        _enteredPin += digit;
      });
      if (_enteredPin.length == 6) {
        // Verification or navigation logic
        widget.onComplete();
      }
    }
  }

  void _onDeleteTap() {
    if (_enteredPin.isNotEmpty) {
      setState(() {
        _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              Image.asset(
                                'assets/images/moorewhitehorizontallogo.png',
                                height: 16.h,
                              ),
                            ],
                          ),
                          //Passcode Icon
                          // Container(
                          //   padding: EdgeInsets.all(12.w),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white.withValues(alpha: 0.1),
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: Image.asset(_iconAsset, height: 40.h),
                          // ),
                          // Passcode Icon
                          // Container(
                          //   padding: EdgeInsets.all(12.w),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white.withValues(alpha: 0.1),
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: Icon(
                          //     widget.isTransactionPin
                          //         ? Icons.lock_outline
                          //         : Icons.password_rounded,
                          //     size: 40.sp,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          Text(
                            widget.title,
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Image.asset(_iconAsset, height: 130.h, width: 130.w),
                          // Text(
                          //   widget.subtitle,
                          //   style: GoogleFonts.inter(
                          //     fontSize: 14.sp,
                          //     color: Colors.white.withValues(alpha: 0.8),
                          //   ),
                          // ),
                          SizedBox(height: 20.h),
                          // Passcode indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                width: 16.w,
                                height: 16.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index < _enteredPin.length
                                      ? Colors.white
                                      : Colors.white.withValues(alpha: 0.3),
                                ),
                              );
                            }),
                          ),
                          const Spacer(),
                          PasscodeKeypad(
                            isWhite: true,
                            onDigitTap: _onDigitTap,
                            onDeleteTap: _onDeleteTap,
                          ),
                          SizedBox(height: 24.h),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _enteredPin = '';
                              });
                            },
                            child: Text(
                              'Reset',
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                color: Colors.white.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
