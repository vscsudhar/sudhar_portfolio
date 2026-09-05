import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';
import 'package:sudhar_portfolio/core/utils/responsive_layout.dart';
import 'package:sudhar_portfolio/ui/common/profile_image.dart';
import '../phone_mockup/phone_mockup.dart';

class Level1Hero extends StatefulWidget {
  final VoidCallback onViewWorkTapped;
  final VoidCallback onContactTapped;
  final VoidCallback onDownloadResumeTapped;

  const Level1Hero({
    super.key,
    required this.onViewWorkTapped,
    required this.onContactTapped,
    required this.onDownloadResumeTapped,
  });

  @override
  State<Level1Hero> createState() => _Level1HeroState();
}

class _Level1HeroState extends State<Level1Hero> {
  Offset _mouseOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isMobile = ResponsiveLayout.isMobile(context);
    final screenHeight = MediaQuery.sizeOf(context).height;

    return MouseRegion(
      onHover: (event) {
        if (isDesktop) {
          final size = MediaQuery.sizeOf(context);
          final centerX = size.width / 2;
          final centerY = size.height / 2;
          setState(() {
            _mouseOffset = Offset(
              (event.position.dx - centerX) / centerX,
              (event.position.dy - centerY) / centerY,
            );
          });
        }
      },
      child: Container(
        constraints: BoxConstraints(
          minHeight: isMobile ? screenHeight * 0.9 : screenHeight * 0.95,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : (isDesktop ? 60 : 36),
          vertical: isMobile ? 30 : 60,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1300),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Column: Hero Text, Profile Photo, Badges, & CTAs
                      Expanded(
                        flex: 11,
                        child: _buildHeroLeftContent(isMobile: false),
                      ),
                      const SizedBox(width: 40),
                      // Right Column: Visual Composition with Phone Mockup & Profile Image
                      Expanded(
                        flex: 9,
                        child: _buildHeroVisualComposition(isMobile: false),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      // Profile Image on Mobile
                      ProfileImage(
                        size: 130,
                        borderRadius: 24,
                        mouseOffset: _mouseOffset,
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .scale(begin: const Offset(0.85, 0.85)),
                      const SizedBox(height: 24),
                      _buildHeroLeftContent(isMobile: true),
                      const SizedBox(height: 40),
                      PhoneMockup(mouseOffset: _mouseOffset)
                          .animate()
                          .fadeIn(duration: 800.ms)
                          .scale(begin: const Offset(0.9, 0.9)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroVisualComposition({required bool isMobile}) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // 3D Flutter Smartphone Mockup
        PhoneMockup(mouseOffset: _mouseOffset)
            .animate()
            .fadeIn(duration: 900.ms, curve: Curves.easeOut)
            .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1), duration: 900.ms),

        // Floating Profile Photo in Hero Composition (Top Right)
        Positioned(
          top: -20,
          right: -25,
          child: ProfileImage(
            size: 140,
            borderRadius: 24,
            mouseOffset: _mouseOffset,
          )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .moveY(begin: 0, end: -8, duration: 3000.ms, curve: Curves.easeInOut),
        ),
      ],
    );
  }

  Widget _buildHeroLeftContent({required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Availability & Specialization Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.flutterCyan.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.flutterCyan.withOpacity(0.35)),
            boxShadow: [
              BoxShadow(
                color: AppColors.flutterCyan.withOpacity(0.15),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.accentNeonGreen,
                  shape: BoxShape.circle,
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true))
                  .scale(begin: const Offset(1, 1), end: const Offset(1.4, 1.4), duration: 1200.ms),
              const SizedBox(width: 8),
              Text(
                AppStrings.heroTagline,
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.flutterCyan,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0),

        const SizedBox(height: 20),

        // Name and Identity: SUDHARSAN
        Text(
          AppStrings.developerName,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 42 : 64,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.5,
            color: Colors.white,
            height: 1.05,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 700.ms).slideY(begin: 0.1, end: 0),

        const SizedBox(height: 6),

        // Primary Professional Title: Full-Stack Developer
        ShaderMask(
          shaderCallback: (bounds) => AppColors.heroTextGradient.createShader(bounds),
          child: Text(
            AppStrings.roleTitle,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.spaceGrotesk(
              fontSize: isMobile ? 26 : 38,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
        ).animate().fadeIn(delay: 350.ms, duration: 700.ms).slideY(begin: 0.1, end: 0),

        const SizedBox(height: 14),

        // Supporting Specialization & Description
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Text(
            AppStrings.heroSubtext,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 15 : 18,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
              height: 1.6,
            ),
          ),
        ).animate().fadeIn(delay: 500.ms, duration: 700.ms),

        const SizedBox(height: 26),

        // Core Tech Focus Pills with Flutter as Strongest Emphasis
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildTechPill("Flutter Core", Icons.flutter_dash, AppColors.flutterCyan, isPrimary: true),
            _buildTechPill("Dart 3.x", Icons.code, AppColors.accentNeonGreen, isPrimary: true),
            _buildTechPill("Full-Stack Apps", Icons.hub_rounded, AppColors.accentIndigo),
            _buildTechPill("Stacked MVVM", Icons.layers, AppColors.accentPurple),
            _buildTechPill("REST & WebSockets", Icons.sensors_rounded, AppColors.accentAmber),
          ],
        ).animate().fadeIn(delay: 650.ms, duration: 700.ms),

        const SizedBox(height: 36),

        // Hero CTA Action Buttons: View My Work & Let's Connect
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 14,
          children: [
            _HeroPrimaryButton(
              text: AppStrings.btnViewWork,
              icon: Icons.rocket_launch_rounded,
              onTap: widget.onViewWorkTapped,
            ),
            _HeroSecondaryButton(
              text: AppStrings.btnContactMe,
              icon: Icons.chat_bubble_outline_rounded,
              onTap: widget.onContactTapped,
            ),
            _HeroOutlineButton(
              text: AppStrings.btnDownloadResume,
              icon: Icons.download_rounded,
              onTap: widget.onDownloadResumeTapped,
            ),
          ],
        ).animate().fadeIn(delay: 750.ms, duration: 700.ms).slideY(begin: 0.2, end: 0),
      ],
    );
  }

  Widget _buildTechPill(String title, IconData icon, Color color, {bool isPrimary = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isPrimary ? 14 : 11, vertical: isPrimary ? 8 : 6),
      decoration: BoxDecoration(
        color: color.withOpacity(isPrimary ? 0.15 : 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color.withOpacity(isPrimary ? 0.6 : 0.25),
          width: isPrimary ? 1.5 : 1.0,
        ),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isPrimary ? 15 : 13, color: color),
          const SizedBox(width: 6),
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              color: isPrimary ? Colors.white : AppColors.textPrimary,
              fontSize: isPrimary ? 12.5 : 11.5,
              fontWeight: isPrimary ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPrimaryButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _HeroPrimaryButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_HeroPrimaryButton> createState() => _HeroPrimaryButtonState();
}

class _HeroPrimaryButtonState extends State<_HeroPrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? const LinearGradient(
                    colors: [Color(0xFF00E5FF), Color(0xFF00F5A0)],
                  )
                : AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColors.flutterCyan.withOpacity(_isHovered ? 0.5 : 0.3),
                blurRadius: _isHovered ? 24 : 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Icon(widget.icon, size: 16, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroSecondaryButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _HeroSecondaryButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_HeroSecondaryButton> createState() => _HeroSecondaryButtonState();
}

class _HeroSecondaryButtonState extends State<_HeroSecondaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.surfaceLight : AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isHovered ? AppColors.flutterCyan : const Color(0x33FFFFFF),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Icon(widget.icon, size: 16, color: AppColors.flutterCyan),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroOutlineButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _HeroOutlineButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_HeroOutlineButton> createState() => _HeroOutlineButtonState();
}

class _HeroOutlineButtonState extends State<_HeroOutlineButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0x14FFFFFF) : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isHovered ? Colors.white70 : const Color(0x26FFFFFF),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.spaceGrotesk(
                  color: AppColors.textPrimary,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Icon(widget.icon, size: 15, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
