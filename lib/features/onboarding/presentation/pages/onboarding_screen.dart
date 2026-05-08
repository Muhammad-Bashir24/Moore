import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:moore/core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: 'Seamless Onboarding',
      description:
          'Set up budgets effortlessly to manage your expenses. Take control of your money with ease.',
      image: 'assets/images/mooreonboardingimage1.png',
      isSvg: false,
    ),
    OnboardingData(
      title: 'Effortless Transactions',
      description:
          'Experience seamless financial transactions with Moore. Managing your money has never been this easy.',
      image: 'assets/images/mooreonboardingimage2.png',
      isSvg: false,
    ),
    OnboardingData(
      title: 'Simplify Daily Spending',
      description:
          'Moore makes managing your daily expenses a breeze. Stay in control of your day-to-day spending with our user-friendly tools.',
      image: 'assets/images/mooreonboardingimage3.svg',
      isSvg: true,
    ),
    OnboardingData(
      title: 'Invest Smarter',
      description:
          'Discover a simpler way to invest. Our platform is built to be easy and rewarding.',
      image: 'assets/images/mooreonboardingimage4.svg',
      isSvg: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // Top Progress Indicator (Stories style)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: _onboardingData.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 4.h,
                    dotWidth: 80.w,
                    spacing: 8.w,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white.withValues(alpha: 0.3),
                    expansionFactor: 1.1,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              // Logo
              Image.asset('assets/images/logo2.png', height: 40.h),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {},
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingPageContent(data: _onboardingData[index]);
                  },
                ),
              ),
              // Bottom Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('I already have an account'),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF4C6FFF,
                        ), // Lighter blue for CTA
                      ),
                      child: const Text('Open account'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;
  final bool isSvg;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
    required this.isSvg,
  });
}

class OnboardingPageContent extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPageContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Illustration
              SizedBox(
                height: 300.h,
                child: data.isSvg
                    ? SvgPicture.asset(data.image)
                    : Image.asset(data.image),
              ),
              SizedBox(height: 40.h),
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 14.sp,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
