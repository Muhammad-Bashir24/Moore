import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/congratulations_bottom_sheet.dart';
import 'success_page.dart';

class SecurityQuestionsPage extends StatefulWidget {
  const SecurityQuestionsPage({super.key});

  @override
  State<SecurityQuestionsPage> createState() => _SecurityQuestionsPageState();
}

class _SecurityQuestionsPageState extends State<SecurityQuestionsPage> {
  String? selectedQuestion;
  final _answerController = TextEditingController();
  bool agreedToTerms = false;

  final List<String> questions = [
    'What is the name of your favorite childhood friend?',
    'What primary school did you attend?',
    'What is the name of your first pet?',
    'What\'s the name of your best Uncle?',
    'What street did you grow up on as a kid?',
    'In what city did you meet your spouse or partner?',
  ];

  void _onProceed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CongratulationsBottomSheet(
        onLogin: () {
          Navigator.pop(context); // Close bottom sheet
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SuccessPage(step: 1),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(
                    title: 'Set Security Questions',
                    subtitle: 'Secure your account',
                    currentStep: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h),
                        Text(
                          'Select and answer 3 security questions',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: AppColors.gray,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Text(
                              'Security question 1',
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.deepBlue,
                              ),
                            ),
                            Text(
                              ' *',
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.lightGray),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedQuestion,
                              hint: Text(
                                'Select a question',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: AppColors.gray.withValues(alpha: 0.5),
                                ),
                              ),
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.gray),
                              items: questions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedQuestion = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        AuthTextField(
                          label: 'Your answer',
                          hintText: 'Enter your answer',
                          controller: _answerController,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Checkbox(
                              value: agreedToTerms,
                              onChanged: (value) {
                                setState(() {
                                  agreedToTerms = value ?? false;
                                });
                              },
                              activeColor: AppColors.primaryBlue,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    color: AppColors.gray,
                                  ),
                                  children: [
                                    const TextSpan(text: 'I agree to Moore '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: GoogleFonts.inter(
                                        color: AppColors.primaryBlue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Terms of Service',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: ElevatedButton(
              onPressed: agreedToTerms && selectedQuestion != null && _answerController.text.isNotEmpty ? _onProceed : null,
              child: const Text('Proceed'),
            ),
          ),
        ],
      ),
    );
  }
}
