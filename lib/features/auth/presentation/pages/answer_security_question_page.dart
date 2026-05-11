import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moore/core/theme/app_colors.dart';
import 'package:moore/features/auth/presentation/pages/welcome_back_login_page.dart';
import 'package:moore/features/auth/presentation/widgets/auth_widgets.dart';

class AnswerSecurityQuestionPage extends StatefulWidget {
  final String phoneNumber;

  const AnswerSecurityQuestionPage({super.key, required this.phoneNumber});

  @override
  State<AnswerSecurityQuestionPage> createState() =>
      _AnswerSecurityQuestionPageState();
}

class _AnswerSecurityQuestionPageState
    extends State<AnswerSecurityQuestionPage> {
  final _answerController = TextEditingController();
  final List<String> _questions = [
    'What is the name of your favorite childhood friend?',
    'What primary school did you attend?',
    'What is the name of your first pet?',
    'What\'s the name of your best Uncle?',
    'What street did you grow up on as a kid?',
    'In what city did you meet your spouse or partner?',
  ];
  String? _selectedQuestion;

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AuthHeader(
            title: 'Answer Security Question',
            subtitle: '', // Design has empty subtitle here
            showProgress: false,
            showStep: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To proceed, please answer one of your security questions set during account creation.',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: AppColors.gray,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Security question',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.deepBlue,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.lightGray),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedQuestion,
                        isExpanded: true,
                        hint: Text(
                          'Select a security question',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: AppColors.gray,
                          ),
                        ),
                        items: _questions
                            .map(
                              (question) => DropdownMenuItem(
                                value: question,
                                child: Text(
                                  question,
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    color: AppColors.deepBlue,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedQuestion = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AuthTextField(
                    label: 'Answer',
                    hintText: 'Your answer',
                    controller: _answerController,
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: ElevatedButton(
              onPressed:
                  _selectedQuestion != null && _answerController.text.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeBackLoginPage(
                            phoneNumber: '+234 ${widget.phoneNumber}',
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text('Proceed'),
            ),
          ),
        ],
      ),
    );
  }
}
