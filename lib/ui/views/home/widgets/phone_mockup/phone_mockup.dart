import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';



class PhoneMockup extends StatefulWidget {
  final Offset mouseOffset;

  const PhoneMockup({super.key, this.mouseOffset = Offset.zero});

  @override
  State<PhoneMockup> createState() => _PhoneMockupState();
}

class _PhoneMockupState extends State<PhoneMockup> {
  int _activeBottomNav = 0;
  bool _isBalanceHidden = false;
  int _selectedAssetIndex = 0;

  final List<Map<String, dynamic>> _assets = [
    {"name": "Flutter Coin", "symbol": "FLT", "price": "\$142.80", "change": "+14.2%", "up": true},
    {"name": "Dart Token", "symbol": "DRT", "price": "\$89.50", "change": "+8.7%", "up": true},
    {"name": "Ethereum", "symbol": "ETH", "price": "\$3,420.00", "change": "-1.4%", "up": false},
  ];

  @override
  Widget build(BuildContext context) {
    // Parallax 3D tilt calculation
    final tiltX = -widget.mouseOffset.dy * 0.08;
    final tiltY = widget.mouseOffset.dx * 0.08;

    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(tiltX)
          ..rotateY(tiltY),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Ambient soft glowing backdrop
            Positioned(
              child: Container(
                width: 320,
                height: 580,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.flutterCyan.withOpacity(0.25),
                      blurRadius: 70,
                      spreadRadius: 10,
                    ),
                    BoxShadow(
                      color: AppColors.accentIndigo.withOpacity(0.20),
                      blurRadius: 90,
                      spreadRadius: 20,
                    ),
                  ],
                ),
              ),
            ),

            // Smartphone Outer Chassis
            Container(
              width: 300,
              height: 590,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(46),
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E3A52), Color(0xFF131A29), Color(0xFF0F1522)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 35,
                    offset: const Offset(0, 20),
                  ),
                  BoxShadow(
                    color: AppColors.flutterCyan.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: -2,
                  ),
                ],
                border: Border.all(
                  color: AppColors.flutterCyan.withOpacity(0.4),
                  width: 2.2,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(38),
                child: Container(
                  color: const Color(0xFF0B0F19),
                  child: Stack(
                    children: [
                      // Screen Content
                      Column(
                        children: [
                          // Status Bar & Dynamic Island
                          _buildStatusBar(),

                          // Mini App Content
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildAppHeader(),
                                  const SizedBox(height: 12),
                                  _buildBalanceCard(),
                                  const SizedBox(height: 14),
                                  _buildQuickActions(),
                                  const SizedBox(height: 14),
                                  _buildAssetTabs(),
                                  const SizedBox(height: 12),
                                  _buildMiniChart(),
                                  const SizedBox(height: 12),
                                  _buildTransactions(),
                                ],
                              ),
                            ),
                          ),

                          // Phone Bottom Navigation
                          _buildPhoneBottomNav(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Floating Tech Badge 1: Flutter 3.x (Top Left)
            Positioned(
              left: -35,
              top: 70,
              child: _buildFloatingBadge(
                icon: Icons.flutter_dash,
                title: "Flutter 3.x",
                subtitle: "60 FPS Render",
                gradient: const LinearGradient(
                  colors: [Color(0xFF02569B), Color(0xFF00D2FF)],
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true))
                  .moveY(begin: 0, end: -10, duration: 2400.ms, curve: Curves.easeInOut),
            ),

            // Floating Tech Badge 2: Dart 3.x (Top Right)
            Positioned(
              right: -35,
              top: 130,
              child: _buildFloatingBadge(
                icon: Icons.code,
                title: "Dart 3.x",
                subtitle: "Type-Safe & Fast",
                gradient: const LinearGradient(
                  colors: [Color(0xFF00F5A0), Color(0xFF00D2FF)],
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true))
                  .moveY(begin: 0, end: 12, duration: 2800.ms, curve: Curves.easeInOut),
            ),

            // Floating Tech Badge 3: Stacked MVVM (Bottom Left)
            Positioned(
              left: -40,
              bottom: 120,
              child: _buildFloatingBadge(
                icon: Icons.layers,
                title: "Stacked MVVM",
                subtitle: "Clean Architecture",
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true))
                  .moveY(begin: 0, end: -8, duration: 3200.ms, curve: Curves.easeInOut),
            ),

            // Floating Tech Badge 4: Play Store Live (Bottom Right)
            Positioned(
              right: -30,
              bottom: 60,
              child: _buildFloatingBadge(
                icon: Icons.shop_two_rounded,
                title: "Live on Stores",
                subtitle: "Play Store & iOS",
                gradient: const LinearGradient(
                  colors: [Color(0xFF00F5A0), Color(0xFF00D2FF)],
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true))
                  .moveY(begin: 0, end: 10, duration: 2600.ms, curve: Curves.easeInOut),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      padding: const EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "9:41",
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          // Dynamic Island Capsule
          Container(
            width: 76,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0x33FFFFFF), width: 0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E293B),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: AppColors.accentNeonGreen,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.signal_cellular_alt, color: Colors.white, size: 11),
              const SizedBox(width: 3),
              const Icon(Icons.wifi, color: Colors.white, size: 11),
              const SizedBox(width: 3),
              const Icon(Icons.battery_full, color: AppColors.accentNeonGreen, size: 13),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
                border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
              ),
              child: const Center(
                child: Text(
                  "S",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back,",
                  style: GoogleFonts.outfit(color: AppColors.textMuted, fontSize: 10),
                ),
                Text(
                  "Sudharsanan D",
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0x22FFFFFF)),
          ),
          child: const Stack(
            children: [
              Icon(Icons.notifications_outlined, color: Colors.white, size: 15),
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: AppColors.flutterCyan,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.flutterCyan.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.flutterCyan.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Balance",
                style: GoogleFonts.outfit(color: AppColors.textSecondary, fontSize: 10),
              ),
              InkWell(
                onTap: () => setState(() => _isBalanceHidden = !_isBalanceHidden),
                child: Icon(
                  _isBalanceHidden ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.flutterCyan,
                  size: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _isBalanceHidden ? "••••••••" : "\$48,920.50",
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.accentNeonGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_upward, color: AppColors.accentNeonGreen, size: 9),
                    const SizedBox(width: 2),
                    Text(
                      "+24.8% this month",
                      style: GoogleFonts.outfit(
                        color: AppColors.accentNeonGreen,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {"icon": Icons.arrow_upward, "label": "Send", "color": AppColors.flutterCyan},
      {"icon": Icons.arrow_downward, "label": "Receive", "color": AppColors.accentNeonGreen},
      {"icon": Icons.swap_horiz, "label": "Swap", "color": AppColors.accentIndigo},
      {"icon": Icons.qr_code_scanner, "label": "Pay", "color": AppColors.accentAmber},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((act) {
        return Column(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: (act["color"] as Color).withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: (act["color"] as Color).withOpacity(0.3)),
              ),
              child: Icon(act["icon"] as IconData, color: act["color"] as Color, size: 18),
            ),
            const SizedBox(height: 4),
            Text(
              act["label"] as String,
              style: GoogleFonts.outfit(color: AppColors.textSecondary, fontSize: 10),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildAssetTabs() {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _assets.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final isSel = _selectedAssetIndex == index;
          return InkWell(
            onTap: () => setState(() => _selectedAssetIndex = index),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isSel ? AppColors.flutterCyan.withOpacity(0.2) : AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSel ? AppColors.flutterCyan : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  _assets[index]["symbol"],
                  style: GoogleFonts.spaceGrotesk(
                    color: isSel ? AppColors.flutterCyan : AppColors.textMuted,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMiniChart() {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x1AFFFFFF)),
      ),
      child: CustomPaint(
        painter: _MiniSparklinePainter(),
      ),
    );
  }

  Widget _buildTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Activities",
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        _buildTxItem("Flutter App Store Payout", "+\$2,450.00", "Today", AppColors.accentNeonGreen),
        _buildTxItem("Codemagic Build Cloud", "-\$29.00", "Yesterday", AppColors.accentCoral),
      ],
    );
  }

  Widget _buildTxItem(String title, String amount, String date, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(
                  color == AppColors.accentNeonGreen ? Icons.arrow_downward : Icons.arrow_upward,
                  color: color,
                  size: 11,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.outfit(color: AppColors.textMuted, fontSize: 8),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: GoogleFonts.spaceGrotesk(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneBottomNav() {
    final icons = [Icons.home_filled, Icons.account_balance_wallet, Icons.bar_chart, Icons.person];
    return Container(
      height: 44,
      decoration: const BoxDecoration(
        color: Color(0xFF090C14),
        border: Border(top: BorderSide(color: Color(0x1AFFFFFF))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (i) {
          final isSel = _activeBottomNav == i;
          return InkWell(
            onTap: () => setState(() => _activeBottomNav = i),
            child: Icon(
              icons[i],
              color: isSel ? AppColors.flutterCyan : AppColors.textMuted,
              size: 18,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFloatingBadge({
    required IconData icon,
    required String title,
    required String subtitle,
    required Gradient gradient,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated.withOpacity(0.92),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: AppColors.flutterCyan.withOpacity(0.12),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.black, size: 14),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.outfit(
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniSparklinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final points = [0.2, 0.4, 0.35, 0.6, 0.5, 0.75, 0.7, 0.95];
    final path = Path();
    final fillPath = Path();

    final stepX = size.width / (points.length - 1);
    path.moveTo(0, size.height * (1 - points[0]));
    fillPath.moveTo(0, size.height * (1 - points[0]));

    for (int i = 1; i < points.length; i++) {
      final x = i * stepX;
      final y = size.height * (1 - points[i]);
      path.lineTo(x, y);
      fillPath.lineTo(x, y);
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [AppColors.flutterCyan.withOpacity(0.3), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final linePaint = Paint()
      ..color = AppColors.flutterCyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
