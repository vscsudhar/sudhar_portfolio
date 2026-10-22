import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';
import 'package:sudhar_portfolio/core/models/experience_model.dart';
import 'package:sudhar_portfolio/core/utils/responsive_layout.dart';

class Level4Experience extends StatelessWidget {
  const Level4Experience({super.key});

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
              // Section Header
              _buildSectionHeader(isMobile),

              const SizedBox(height: 50),

              // Development Journey Timeline
              _buildJourneyTimeline(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.accentIndigo.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.accentIndigo.withValues(alpha: 0.4)),
          ),
          child: Text(
            "LEVEL 04 • DEVELOPMENT JOURNEY",
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.accentIndigo,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          AppStrings.journeyHeading,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 32 : 44,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 750),
          child: Text(
            AppStrings.journeySubheading,
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 15 : 17,
              color: AppColors.textSecondary,
              height: 1.55,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJourneyTimeline(bool isMobile) {
    return Column(
      children: List.generate(JourneyData.pillars.length, (index) {
        final pillar = JourneyData.pillars[index];
        final isLast = index == JourneyData.pillars.length - 1;

        return _PillarCard(
          pillar: pillar,
          isLast: isLast,
          isMobile: isMobile,
          index: index,
        );
      }),
    );
  }
}

class _PillarCard extends StatefulWidget {
  final JourneyPillar pillar;
  final bool isLast;
  final bool isMobile;
  final int index;

  const _PillarCard({
    required this.pillar,
    required this.isLast,
    required this.isMobile,
    required this.index,
  });

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.pillar;

    return Stack(
      children: [
        // Left timeline line & icon (Desktop/Tablet)
        if (!widget.isMobile) ...[
          // Vertical connecting line
          if (!widget.isLast)
            Positioned(
              left: 21,
              top: 44,
              bottom: 0,
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      p.accentColor.withValues(alpha: 0.6),
                      const Color(0x1AFFFFFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          // Timeline Node icon
          Positioned(
            left: 0,
            top: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: p.accentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: p.accentColor,
                  width: _isHovered ? 2.0 : 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: p.accentColor.withValues(alpha: _isHovered ? 0.4 : 0.2),
                    blurRadius: 14,
                  ),
                ],
              ),
              child: Center(
                child: Icon(p.icon, size: 18, color: p.accentColor),
              ),
            ),
          ),
        ],

        // Pillar Content Card
        Padding(
          padding: EdgeInsets.only(
            left: widget.isMobile ? 0 : 68,
            bottom: 30,
          ),
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: _isHovered ? AppColors.surfaceLight : AppColors.surfaceCard,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: _isHovered ? p.accentColor.withValues(alpha: 0.5) : const Color(0x1AFFFFFF),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered ? p.accentColor.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.2),
                    blurRadius: _isHovered ? 24 : 10,
                    offset: Offset(0, _isHovered ? 6 : 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag & Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          p.title,
                          style: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: p.accentColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          p.tag,
                          style: GoogleFonts.jetBrainsMono(
                            color: p.accentColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    p.summary,
                    style: GoogleFonts.outfit(
                      color: AppColors.textSecondary,
                      fontSize: 14.5,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 18),
                  // Bullet Points
                  ...p.bulletPoints.map((bp) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: p.accentColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              bp,
                              style: GoogleFonts.outfit(
                                color: AppColors.textPrimary,
                                fontSize: 13.5,
                                height: 1.45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  // Tech Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: p.techTags.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0x14FFFFFF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          tech,
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.flutterCyan,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 550.ms, delay: (widget.index * 120).ms)
        .slideY(begin: 0.1, end: 0);
  }
}
