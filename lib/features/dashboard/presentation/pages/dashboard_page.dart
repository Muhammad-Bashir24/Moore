import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moore/core/theme/app_colors.dart';
import 'package:moore/features/auth/presentation/widgets/login_modals.dart';

class DashboardPage extends StatefulWidget {
  final bool showDeviceLinkedSuccess;

  const DashboardPage({super.key, this.showDeviceLinkedSuccess = false});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'To Timothy Campbell',
      'subtitle': '12/09/2023 - To: 13/09/2023',
      'amount': '+N150,000.00',
      'imagePath': 'assets/images/timothyimage.png',
      'isPositive': true,
    },
    {
      'title': 'From Samuel Darasimi',
      'subtitle': 'Today, 14:22',
      'amount': '+N150,000.00',
      'imagePath': 'assets/images/samuelimage.png',
      'isPositive': true,
    },
    {
      'title': 'To Timothy Campbell',
      'subtitle': '12/09/2023 - To: 13/09/2023',
      'amount': '+N150,000.00',
      'imagePath': 'assets/images/timothyimage.png',
      'isPositive': true,
    },
    {
      'title': 'From Samuel Darasimi',
      'subtitle': 'Today, 14:22',
      'amount': '+N150,000.00',
      'imagePath': 'assets/images/samuelimage.png',
      'isPositive': true,
    },
    {
      'title': 'To Timothy Campbell',
      'subtitle': '12/09/2023 - To: 13/09/2023',
      'amount': '+N150,000.00',
      'imagePath': 'assets/images/timothyimage.png',
      'isPositive': true,
    },
    {
      'title': 'From Samuel Darasimi',
      'subtitle': 'Today, 14:22',
      'amount': '+N150,000.00',
      'imagePath': 'assets/images/samuelimage.png',
      'isPositive': true,
    },
  ];
  void initState() {
    super.initState();
    if (widget.showDeviceLinkedSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showDeviceLinkedSuccess();
      });
    }
  }

  void _showDeviceLinkedSuccess() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DeviceLinkedBottomSheet(
        onProceed: () {
          Navigator.pop(context);
          _showBiometricsActivation();
        },
      ),
    );
  }

  void _showBiometricsActivation() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BiometricsBottomSheet(
        onActivate: () {
          Navigator.pop(context);
          // Handle biometrics activation
        },
        onNotNow: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dark Blue Gradient Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0D1B3E),
                    Color(0xFF1A237E),
                    Color(0xFF311B92),
                  ],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.white,
                            child: Text(
                              'TC',
                              style: GoogleFonts.inter(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, Oluwabunmi',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    'Tier 1',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/ai.png',
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 16.w),
                          Icon(Icons.search, color: Colors.white, size: 24.sp),
                          SizedBox(width: 16.w),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Switch Account',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'N2,905,215.23',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Wallet Account',
                        style: GoogleFonts.inter(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 29.w,
                            vertical: 19.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildActionItem(
                                Icons.add_circle_outline,
                                'Add Money',
                              ),
                              _buildActionItem(Icons.bar_chart, 'Airtime'),
                              _buildActionItem(Icons.wifi, 'Data'),
                              _buildActionItem(Icons.receipt_long, 'Bills'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 80.h),
                    ],
                  ),
                ),
              ),
            ),
            // White Content Area
            Transform.translate(
              offset: Offset(0, -20.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Promo Card (WhatsApp Banking)
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FF),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: const Color(0xFFE0E7FF)),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.asset(
                                height: 70.h,
                                width: 70.w,
                                'assets/images/whatsappimage.png',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'WhatsApp Banking',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: AppColors.deepBlue,
                                    ),
                                  ),
                                  Text(
                                    'Manage your banking effortlessly! Check your balance, transfer funds, and purchase airtime directly through WhatsApp.',
                                    style: GoogleFonts.inter(
                                      fontSize: 10.sp,
                                      color: AppColors.gray,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.close,
                              size: 16.sp,
                              color: AppColors.gray,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            4,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              width: 6.w,
                              height: 6.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0
                                    ? AppColors.primaryBlue
                                    : AppColors.lightGray,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          'Swipe up to view more transactions',
                          style: GoogleFonts.inter(
                            fontSize: 10.sp,
                            color: AppColors.gray,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 300
                            .h, // Adjust height as needed for the scrollable area
                        child: ListView.builder(
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final tx = transactions[index];
                            return _buildTransactionItem(
                              tx['title'],
                              tx['subtitle'],
                              tx['amount'],
                              imagePath: tx['imagePath'],
                              isPositive: tx['isPositive'],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.gray,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Transfer'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports),
            label: 'Games',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24.sp),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 10.sp),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    String title,
    String subtitle,
    String amount, {
    String? imagePath,
    bool isPositive = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.lightGray.withValues(alpha: 0.3),
            backgroundImage: imagePath != null ? AssetImage(imagePath) : null,
            child: imagePath == null
                ? Icon(Icons.person, color: AppColors.gray)
                : null,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.deepBlue,
                  ),
                ),
                Row(
                  children: [
                    // Text(
                    //   "From:",
                    //   style: GoogleFonts.inter(
                    //     fontSize: 12.sp,
                    //     color: AppColors.gray,
                    //   ),
                    // ),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.gray,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
