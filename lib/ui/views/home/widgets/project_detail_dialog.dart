import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/models/project_model.dart';

class ProjectDetailDialog extends StatelessWidget {
  final ProjectModel project;
  final Function(String) onOpenUrl;

  const ProjectDetailDialog({
    super.key,
    required this.project,
    required this.onOpenUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 740, maxHeight: 780),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated.withValues(alpha: 0.96),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: project.primaryColor.withValues(alpha: 0.4),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.8),
                blurRadius: 40,
                offset: const Offset(0, 15),
              ),
              BoxShadow(
                color: project.primaryColor.withValues(alpha: 0.18),
                blurRadius: 30,
              ),
            ],
          ),
          child: Column(
            children: [
              // Dialog Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      project.primaryColor.withValues(alpha: 0.2),
                      project.secondaryColor.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  border: const Border(
                    bottom: BorderSide(color: Color(0x1AFFFFFF)),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: project.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: project.primaryColor.withValues(alpha: 0.4)),
                      ),
                      child: Icon(project.icon, color: project.primaryColor, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  project.title,
                                  style: GoogleFonts.spaceGrotesk(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (project.isLiveOnStores)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: AppColors.accentNeonGreen.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: AppColors.accentNeonGreen.withValues(alpha: 0.5)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.rocket_launch_rounded, size: 10, color: AppColors.accentNeonGreen),
                                      const SizedBox(width: 4),
                                      Text(
                                        "PLAY STORE LIVE",
                                        style: GoogleFonts.jetBrainsMono(
                                          color: AppColors.accentNeonGreen,
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              else if (project.hasBackend)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: AppColors.flutterCyan.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.4)),
                                  ),
                                  child: Text(
                                    "FULL-STACK (API)",
                                    style: GoogleFonts.jetBrainsMono(
                                      color: AppColors.flutterCyan,
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Text(
                            project.subtitle,
                            style: GoogleFonts.outfit(
                              color: AppColors.textSecondary,
                              fontSize: 12.5,
                            ),
                          ),
                          if (project.company != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              project.company!.toLowerCase().contains("independent") ||
                                      project.company!.toLowerCase().contains("own")
                                  ? "Category: ${project.company!}"
                                  : "Delivered at: ${project.company!}",
                              style: GoogleFonts.jetBrainsMono(
                                color: AppColors.flutterCyan,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded, color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Dialog Body
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Overview
                      Text(
                        "Overview",
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        project.description,
                        style: GoogleFonts.outfit(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 22),

                      // Key Features List
                      Text(
                        "Key Engineering Features",
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...project.keyFeatures.map((feat) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: AppColors.flutterCyan.withValues(alpha: 0.15),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.check, color: AppColors.flutterCyan, size: 12),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  feat,
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

                      const SizedBox(height: 22),

                      // Tech Stack
                      Text(
                        "Technology Stack",
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.techStack.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceCard,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0x22FFFFFF)),
                            ),
                            child: Text(
                              tech,
                              style: GoogleFonts.jetBrainsMono(
                                color: AppColors.flutterCyan,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              // Dialog Footer with direct categorized Play Store & GitHub links
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0x1AFFFFFF))),
                ),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    // Play Store Button if available
                    if (project.playStoreUrl != null)
                      ElevatedButton.icon(
                        onPressed: () => onOpenUrl(project.playStoreUrl!),
                        icon: const Icon(Icons.shop_two_rounded, size: 16, color: Colors.black),
                        label: Text(
                          "Google Play Store",
                          style: GoogleFonts.spaceGrotesk(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentNeonGreen,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),

                    // Main / Frontend Mobile App GitHub Link
                    if (project.githubUrl != null)
                      ElevatedButton.icon(
                        onPressed: () => onOpenUrl(project.githubUrl!),
                        icon: const Icon(Icons.code_rounded, size: 16, color: Colors.black),
                        label: Text(
                          project.hasBackend ? "App Repo (GitHub)" : "GitHub Repository",
                          style: GoogleFonts.spaceGrotesk(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: project.primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),

                    // Backend API Link if available
                    if (project.backendGithubUrl != null)
                      OutlinedButton.icon(
                        onPressed: () => onOpenUrl(project.backendGithubUrl!),
                        icon: const Icon(Icons.dns_rounded, size: 15, color: AppColors.accentNeonGreen),
                        label: Text(
                          "Backend API",
                          style: GoogleFonts.spaceGrotesk(
                            color: AppColors.accentNeonGreen,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.accentNeonGreen, width: 1.2),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),

                    // Admin Panel Link if available
                    if (project.adminGithubUrl != null)
                      OutlinedButton.icon(
                        onPressed: () => onOpenUrl(project.adminGithubUrl!),
                        icon: const Icon(Icons.admin_panel_settings_rounded, size: 15, color: Color(0xFF38BDF8)),
                        label: Text(
                          "Admin Panel Repo",
                          style: GoogleFonts.spaceGrotesk(
                            color: const Color(0xFF38BDF8),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF38BDF8), width: 1.2),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
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
