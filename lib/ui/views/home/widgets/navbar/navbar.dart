import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';
import 'package:sudhar_portfolio/core/utils/responsive_layout.dart';


class Navbar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onNavItemTapped;
  final VoidCallback onContactTapped;
  final VoidCallback onOpenDrawer;
  final VoidCallback? onResumeTapped;

  const Navbar({
    super.key,
    required this.activeIndex,
    required this.onNavItemTapped,
    required this.onContactTapped,
    required this.onOpenDrawer,
    this.onResumeTapped,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 40,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.75),
            border: const Border(
              bottom: BorderSide(color: Color(0x1AFFFFFF), width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo
              _buildBrandLogo(),

              // Desktop Navigation Links
              if (!isMobile)
                _buildDesktopNavLinks()
              else
                IconButton(
                  onPressed: onOpenDrawer,
                  icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 26),
                ),

              // Action CTA Buttons
              if (!isMobile)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (onResumeTapped != null) ...[
                      _ResumeNavButton(onTap: onResumeTapped!),
                      const SizedBox(width: 12),
                    ],
                    _buildContactButton(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandLogo() {
    return InkWell(
      onTap: () => onNavItemTapped(0),
      borderRadius: BorderRadius.circular(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.flutterCyan.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "S",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.developerName,
                style: GoogleFonts.spaceGrotesk(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.flutterCyan,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "FULL-STACK • FLUTTER",
                    style: GoogleFonts.jetBrainsMono(
                      color: AppColors.flutterCyan,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopNavLinks() {
    final navItems = [
      {"name": AppStrings.navHero, "tag": "01"},
      {"name": AppStrings.navAbout, "tag": "02"},
      {"name": AppStrings.navProjects, "tag": "03"},
      {"name": AppStrings.navJourney, "tag": "04"},
      {"name": AppStrings.navContact, "tag": "05"},
    ];


    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(navItems.length, (index) {
        final item = navItems[index];
        final isActive = activeIndex == index;

        return _NavHoverItem(
          title: item["name"]!,
          tag: item["tag"]!,
          isActive: isActive,
          onTap: () => onNavItemTapped(index),
        );
      }),
    );
  }

  Widget _buildContactButton() {
    return _HoverGlowButton(
      text: "Get in Touch",
      onTap: onContactTapped,
      icon: Icons.arrow_outward_rounded,
    );
  }
}

class _NavHoverItem extends StatefulWidget {
  final String title;
  final String tag;
  final bool isActive;
  final VoidCallback onTap;

  const _NavHoverItem({
    required this.title,
    required this.tag,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavHoverItem> createState() => _NavHoverItemState();
}

class _NavHoverItemState extends State<_NavHoverItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isActive
                ? AppColors.flutterCyan.withValues(alpha: 0.1)
                : (_isHovered ? Colors.white.withValues(alpha: 0.05) : Colors.transparent),
          ),
          child: Row(
            children: [
              Text(
                widget.tag,
                style: GoogleFonts.jetBrainsMono(
                  color: widget.isActive ? AppColors.flutterCyan : AppColors.textMuted,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                widget.title,
                style: GoogleFonts.spaceGrotesk(
                  color: widget.isActive
                      ? AppColors.flutterCyan
                      : (_isHovered ? Colors.white : AppColors.textSecondary),
                  fontSize: 14,
                  fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverGlowButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  const _HoverGlowButton({
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  State<_HoverGlowButton> createState() => _HoverGlowButtonState();
}

class _HoverGlowButtonState extends State<_HoverGlowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            gradient: _isHovered ? AppColors.primaryGradient : null,
            color: _isHovered ? null : AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? Colors.transparent : AppColors.flutterCyan.withValues(alpha: 0.4),
              width: 1.2,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.flutterCyan.withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.spaceGrotesk(
                  color: _isHovered ? Colors.black : AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                widget.icon,
                size: 14,
                color: _isHovered ? Colors.black : AppColors.flutterCyan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResumeNavButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ResumeNavButton({required this.onTap});

  @override
  State<_ResumeNavButton> createState() => _ResumeNavButtonState();
}

class _ResumeNavButtonState extends State<_ResumeNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.flutterCyan.withValues(alpha: 0.15)
                : const Color(0x0FFFFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? AppColors.flutterCyan : const Color(0x33FFFFFF),
              width: 1.2,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.flutterCyan.withValues(alpha: 0.25),
                      blurRadius: 12,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.description_rounded,
                size: 15,
                color: _isHovered ? AppColors.flutterCyan : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                "Resume",
                style: GoogleFonts.spaceGrotesk(
                  color: _isHovered ? Colors.white : AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
