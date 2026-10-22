import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';
import 'package:sudhar_portfolio/core/utils/responsive_layout.dart';

class Level5Contact extends StatelessWidget {
  final Function(String) onOpenUrl;
  final Future<void> Function({required String email, String? subject, String? body}) onSendEmail;
  final Future<bool> Function(String) onCopyEmail;
  final VoidCallback onBackToTop;
  final VoidCallback? onResumeTapped;

  const Level5Contact({
    super.key,
    required this.onOpenUrl,
    required this.onSendEmail,
    required this.onCopyEmail,
    required this.onBackToTop,
    this.onResumeTapped,
  });

  Future<void> _handleEmailTap(BuildContext context) async {
    await onSendEmail(
      email: AppStrings.email,
      subject: "Full-Stack / Flutter Project Inquiry",
      body: "Hi Sudharsanan,\n\nI would like to connect with you regarding an application project...",
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF0F172A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: AppColors.flutterCyan.withValues(alpha: 0.5)),
          ),
          content: Row(
            children: [
              const Icon(Icons.mark_email_read_rounded, color: AppColors.flutterCyan, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Created email compose draft to ${AppStrings.email}",
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          action: SnackBarAction(
            label: "Copy Email",
            textColor: AppColors.accentNeonGreen,
            onPressed: () => onCopyEmail(AppStrings.email),
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section Header & CTA Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 48,
                  vertical: isMobile ? 36 : 56,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF131B2A), Color(0xFF0F1522)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.35), width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.flutterCyan.withValues(alpha: 0.12),
                      blurRadius: 35,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.flutterCyan.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.4)),
                      ),
                      child: Text(
                        "LEVEL 05 • GET IN TOUCH",
                        style: GoogleFonts.jetBrainsMono(
                          color: AppColors.flutterCyan,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Heading
                    Text(
                      AppStrings.contactHeading,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: isMobile ? 30 : 44,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.8,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Supporting text
                    Text(
                      AppStrings.contactSubtext,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: isMobile ? 15 : 18,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Display Email Address Badge
                    InkWell(
                      onTap: () => _handleEmailTap(context),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.flutterCyan.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.alternate_email_rounded, color: AppColors.flutterCyan, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              AppStrings.email,
                              style: GoogleFonts.jetBrainsMono(
                                color: AppColors.flutterCyan,
                                fontSize: isMobile ? 13 : 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Action Buttons: Email Me, GitHub, LinkedIn
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 14,
                      children: [
                        _ContactActionBtn(
                          title: AppStrings.btnEmailMe,
                          icon: Icons.mail_outline_rounded,
                          color: AppColors.flutterCyan,
                          isPrimary: true,
                          onTap: () => _handleEmailTap(context),
                        ),
                        if (onResumeTapped != null)
                          _ContactActionBtn(
                            title: "Resume PDF",
                            icon: Icons.description_rounded,
                            color: AppColors.accentNeonGreen,
                            isPrimary: false,
                            onTap: onResumeTapped!,
                          ),
                        _ContactActionBtn(
                          title: AppStrings.btnGitHub,
                          icon: Icons.code_rounded,
                          color: Colors.white,
                          isPrimary: false,
                          onTap: () => onOpenUrl(AppStrings.githubUrl),
                        ),
                        _ContactActionBtn(
                          title: AppStrings.btnLinkedIn,
                          icon: Icons.link_rounded,
                          color: const Color(0xFF0A66C2),
                          isPrimary: false,
                          onTap: () => onOpenUrl(AppStrings.linkedinUrl),
                        ),
                      ],
                    ),

                    const SizedBox(height: 36),

                    // Location & Role Info Banner
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceElevated.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0x1FFFFFFF)),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 20,
                        runSpacing: 8,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.flutter_dash, color: AppColors.flutterCyan, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                "Full-Stack Developer • Flutter Specialist",
                                style: GoogleFonts.spaceGrotesk(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.location_on_outlined, color: AppColors.accentNeonGreen, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                AppStrings.location,
                                style: GoogleFonts.outfit(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
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

              const SizedBox(height: 70),

              // Footer: © 2026 Sudharsan • Full-Stack Developer • Flutter Specialist
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0x1AFFFFFF))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.footerCopyright,
                          style: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          AppStrings.footerRole,
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.flutterCyan,
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                    FloatingActionButton.small(
                      onPressed: onBackToTop,
                      backgroundColor: AppColors.surfaceElevated,
                      foregroundColor: AppColors.flutterCyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.flutterCyan.withValues(alpha: 0.3)),
                      ),
                      tooltip: "Back to Top",
                      child: const Icon(Icons.arrow_upward_rounded, size: 18),
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

class _ContactActionBtn extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ContactActionBtn({
    required this.title,
    required this.icon,
    required this.color,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  State<_ContactActionBtn> createState() => _ContactActionBtnState();
}

class _ContactActionBtnState extends State<_ContactActionBtn> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered ? AppColors.flutterSky : AppColors.flutterCyan)
                : (_isHovered ? AppColors.surfaceLight : AppColors.surfaceElevated),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_isHovered ? widget.color : const Color(0x33FFFFFF)),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: (widget.isPrimary ? AppColors.flutterCyan : widget.color)
                    .withValues(alpha: _isHovered ? 0.4 : 0.15),
                blurRadius: _isHovered ? 20 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: widget.isPrimary ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: GoogleFonts.spaceGrotesk(
                  color: widget.isPrimary ? Colors.black : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
