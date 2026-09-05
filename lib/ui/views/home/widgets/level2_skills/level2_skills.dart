import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';
import 'package:sudhar_portfolio/core/models/skill_model.dart';
import 'package:sudhar_portfolio/core/utils/responsive_layout.dart';

class Level2Skills extends StatelessWidget {
  const Level2Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isDesktop ? 60 : 36),
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header: About Me
              _buildAboutHeader(isMobile),

              const SizedBox(height: 36),

              // Animated Information Cards (About Me Focus Areas)
              _buildAboutCardsGrid(isMobile),

              const SizedBox(height: 60),

              // Technical Skills Section Subtitle & Hierarchy
              _buildSkillsSectionHeader(isMobile),

              const SizedBox(height: 24),

              // PRIMARY SKILLS (Flutter Dominant Hierarchy)
              _buildSkillTierHeader("PRIMARY CORE SKILLS", "Highest Technical Proficiency & Daily Practice", AppColors.flutterCyan),
              const SizedBox(height: 16),
              _buildPrimarySkillsGrid(isMobile),

              const SizedBox(height: 36),

              // SECONDARY & ARCHITECTURAL SKILLS
              _buildSkillTierHeader("SECONDARY SPECIALIZATIONS", "Architecture, Cloud & Real-Time Sync", AppColors.accentIndigo),
              const SizedBox(height: 16),
              _buildSecondarySkillsGrid(isMobile),

              const SizedBox(height: 36),

              // ADDITIONAL / FULL-STACK SKILLS
              _buildSkillTierHeader("ADDITIONAL & FULL-STACK CAPABILITIES", "Backend APIs, Databases & Interactive Graphics", AppColors.textSecondary),
              const SizedBox(height: 16),
              _buildAdditionalSkillsGrid(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.flutterCyan.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.flutterCyan.withOpacity(0.35)),
          ),
          child: Text(
            "LEVEL 02 • ABOUT & SPECIALIZATION",
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.flutterCyan,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          AppStrings.aboutHeading,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 32 : 44,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: Text(
            AppStrings.aboutDescription,
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 15.5 : 18,
              color: AppColors.textPrimary,
              height: 1.65,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutCardsGrid(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isThreeColumn = constraints.maxWidth > 950;
        final isTwoColumn = constraints.maxWidth > 600 && constraints.maxWidth <= 950;

        final crossAxisCount = isThreeColumn ? 3 : (isTwoColumn ? 2 : 1);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            mainAxisExtent: isMobile ? 160 : 170,
          ),
          itemCount: SkillsData.aboutCards.length,
          itemBuilder: (context, index) {
            final card = SkillsData.aboutCards[index];
            return _AboutInfoCard(card: card, index: index);
          },
        );
      },
    );
  }

  Widget _buildSkillsSectionHeader(bool isMobile) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          AppStrings.skillsSubheading,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 20 : 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillTierHeader(String title, String subtitle, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: color.withOpacity(0.4), blurRadius: 8),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.jetBrainsMono(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        Flexible(
          child: Text(
            subtitle,
            textAlign: TextAlign.right,
            style: GoogleFonts.outfit(
              color: AppColors.textMuted,
              fontSize: 11.5,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPrimarySkillsGrid(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1100
            ? 5
            : (constraints.maxWidth > 850
                ? 4
                : (constraints.maxWidth > 550 ? 3 : 2));

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            mainAxisExtent: 135,
          ),
          itemCount: SkillsData.primarySkills.length,
          itemBuilder: (context, index) {
            final skill = SkillsData.primarySkills[index];
            return _SkillGlassCard(skill: skill, index: index, isPrimary: true);
          },
        );
      },
    );
  }

  Widget _buildSecondarySkillsGrid(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1100
            ? 5
            : (constraints.maxWidth > 850
                ? 4
                : (constraints.maxWidth > 550 ? 3 : 2));

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            mainAxisExtent: 125,
          ),
          itemCount: SkillsData.secondarySkills.length,
          itemBuilder: (context, index) {
            final skill = SkillsData.secondarySkills[index];
            return _SkillGlassCard(skill: skill, index: index);
          },
        );
      },
    );
  }

  Widget _buildAdditionalSkillsGrid(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1100
            ? 5
            : (constraints.maxWidth > 850
                ? 4
                : (constraints.maxWidth > 550 ? 3 : 2));

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            mainAxisExtent: 120,
          ),
          itemCount: SkillsData.additionalSkills.length,
          itemBuilder: (context, index) {
            final skill = SkillsData.additionalSkills[index];
            return _SkillGlassCard(skill: skill, index: index, isMuted: true);
          },
        );
      },
    );
  }
}

class _AboutInfoCard extends StatefulWidget {
  final AboutCardItem card;
  final int index;

  const _AboutInfoCard({required this.card, required this.index});

  @override
  State<_AboutInfoCard> createState() => _AboutInfoCardState();
}

class _AboutInfoCardState extends State<_AboutInfoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.card;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: c.isDominant
              ? (AppColors.surfaceElevated)
              : (_isHovered ? AppColors.surfaceLight : AppColors.surfaceCard),
          borderRadius: BorderRadius.circular(20),
          gradient: c.isDominant
              ? LinearGradient(
                  colors: [
                    AppColors.flutterCyan.withOpacity(0.18),
                    AppColors.accentIndigo.withOpacity(0.10),
                    AppColors.surfaceCard,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          border: Border.all(
            color: c.isDominant
                ? AppColors.flutterCyan.withOpacity(_isHovered ? 0.8 : 0.45)
                : (_isHovered ? c.accentColor.withOpacity(0.6) : const Color(0x1AFFFFFF)),
            width: c.isDominant ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: c.accentColor.withOpacity(c.isDominant ? 0.25 : (_isHovered ? 0.2 : 0.05)),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 6 : 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: c.accentColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: c.accentColor.withOpacity(0.35),
                    ),
                  ),
                  child: Icon(c.icon, size: 22, color: c.accentColor),
                ),
                if (c.isDominant)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.flutterCyan.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.flutterCyan.withOpacity(0.4)),
                    ),
                    child: Text(
                      "CORE FOCUS",
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.flutterCyan,
                        fontSize: 9.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.title,
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  c.subtitle,
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.35,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 450.ms, delay: (widget.index * 60).ms)
        .slideY(begin: 0.08, end: 0);
  }
}

class _SkillGlassCard extends StatefulWidget {
  final SkillItem skill;
  final int index;
  final bool isPrimary;
  final bool isMuted;

  const _SkillGlassCard({
    required this.skill,
    required this.index,
    this.isPrimary = false,
    this.isMuted = false,
  });

  @override
  State<_SkillGlassCard> createState() => _SkillGlassCardState();
}

class _SkillGlassCardState extends State<_SkillGlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.skill;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.surfaceLight
              : (widget.isPrimary ? AppColors.surfaceCard : AppColors.surfaceElevated.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? s.accentColor.withOpacity(0.7)
                : (widget.isPrimary
                    ? s.accentColor.withOpacity(0.3)
                    : const Color(0x14FFFFFF)),
            width: widget.isPrimary ? 1.3 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? s.accentColor.withOpacity(0.22) : Colors.black.withOpacity(0.15),
              blurRadius: _isHovered ? 18 : 6,
              offset: Offset(0, _isHovered ? 5 : 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: s.accentColor.withOpacity(widget.isPrimary ? 0.16 : 0.09),
                shape: BoxShape.circle,
                border: Border.all(
                  color: s.accentColor.withOpacity(_isHovered ? 0.6 : 0.2),
                ),
              ),
              child: Icon(
                s.icon,
                color: s.accentColor,
                size: widget.isPrimary ? 22 : 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              s.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
                fontSize: widget.isPrimary ? 13 : 12,
                fontWeight: widget.isPrimary ? FontWeight.w700 : FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              s.category,
              textAlign: TextAlign.center,
              style: GoogleFonts.jetBrainsMono(
                color: AppColors.textMuted,
                fontSize: 9.5,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: (widget.index * 40).ms)
        .slideY(begin: 0.08, end: 0);
  }
}
