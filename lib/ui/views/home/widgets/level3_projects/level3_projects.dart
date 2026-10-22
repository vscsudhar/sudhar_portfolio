import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';
import 'package:sudhar_portfolio/core/models/project_model.dart';
import 'package:sudhar_portfolio/core/utils/responsive_layout.dart';
import '../project_detail_dialog.dart';

class Level3Projects extends StatefulWidget {
  final Function(String) onOpenUrl;

  const Level3Projects({super.key, required this.onOpenUrl});

  @override
  State<Level3Projects> createState() => _Level3ProjectsState();
}

class _Level3ProjectsState extends State<Level3Projects> {
  String _selectedFilter = "All";

  final List<String> _filters = [
    "All",
    "🚀 Live in Stores",
    "🏢 Company & Client Apps",
    "⚡ Full-Stack (With Backend)",
    "🛠️ Independent / Own Created",
    "🌐 Flutter Web",
  ];

  List<ProjectModel> get _filteredProjects {
    if (_selectedFilter == "🚀 Live in Stores") {
      return ProjectsData.projects.where((p) => p.isLiveOnStores).toList();
    } else if (_selectedFilter == "🏢 Company & Client Apps") {
      return ProjectsData.projects
          .where((p) =>
              p.company != null &&
              !p.company!.toLowerCase().contains("independent") &&
              !p.company!.toLowerCase().contains("own"))
          .toList();
    } else if (_selectedFilter == "⚡ Full-Stack (With Backend)") {
      return ProjectsData.projects.where((p) => p.hasBackend).toList();
    } else if (_selectedFilter == "🛠️ Independent / Own Created") {
      return ProjectsData.projects
          .where((p) =>
              p.company != null &&
              (p.company!.toLowerCase().contains("independent") ||
                  p.company!.toLowerCase().contains("own")))
          .toList();
    } else if (_selectedFilter == "🌐 Flutter Web") {
      return ProjectsData.projects.where((p) => p.category == "Flutter Web").toList();
    }
    return ProjectsData.projects;
  }

  void _showProjectDetails(BuildContext context, ProjectModel project) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (context) => ProjectDetailDialog(
        project: project,
        onOpenUrl: widget.onOpenUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isMobile = ResponsiveLayout.isMobile(context);
    final filtered = _filteredProjects;

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

              const SizedBox(height: 30),

              // Filter Category Chips
              _buildFilterChips(isMobile),

              const SizedBox(height: 36),

              // Project Showcase Cards List
              LayoutBuilder(
                builder: (context, constraints) {
                  final isTwoColumn = constraints.maxWidth > 950;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTwoColumn ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: isMobile ? 500 : 460,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final project = filtered[index];
                      return _ProjectCard(
                        key: ValueKey(project.id),
                        project: project,
                        onDetailsTapped: () => _showProjectDetails(context, project),
                        onOpenUrl: widget.onOpenUrl,
                      )
                          .animate()
                          .fadeIn(duration: 400.ms, delay: (index * 60).ms)
                          .slideY(begin: 0.08, end: 0);
                    },
                  );
                },
              ),
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
            color: AppColors.flutterCyan.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.35)),
          ),
          child: Text(
            "LEVEL 03 • PRODUCTION APPS & GITHUB REPOSITORIES",
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
          AppStrings.projectsHeading,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 32 : 44,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Text(
            "Production mobile applications live on the Google Play Store, client & product solutions developed across Rank You Higher, Better Lives, and Shanmara Solutions, alongside independent full-stack ecosystems.",
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

  Widget _buildFilterChips(bool isMobile) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => setState(() => _selectedFilter = filter),
              borderRadius: BorderRadius.circular(30),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.flutterCyan : AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected ? AppColors.flutterCyan : const Color(0x22FFFFFF),
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.flutterCyan.withValues(alpha: 0.35),
                            blurRadius: 12,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  filter,
                  style: GoogleFonts.spaceGrotesk(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onDetailsTapped;
  final Function(String) onOpenUrl;

  const _ProjectCard({
    super.key,
    required this.project,
    required this.onDetailsTapped,
    required this.onOpenUrl,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _isHovered ? p.primaryColor : const Color(0x1AFFFFFF),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? p.primaryColor.withValues(alpha: 0.22) : Colors.black.withValues(alpha: 0.25),
              blurRadius: _isHovered ? 26 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mockup Header with Gradient, App Icon, and Live / Architecture Pill
            Container(
              height: 125,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [
                    p.primaryColor.withValues(alpha: 0.22),
                    p.secondaryColor.withValues(alpha: 0.08),
                    AppColors.surfaceElevated,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 48,
                          height: 48,
                          transform: Matrix4.diagonal3Values(_isHovered ? 1.08 : 1.0, _isHovered ? 1.08 : 1.0, 1.0),
                          decoration: BoxDecoration(
                            color: p.primaryColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: p.primaryColor.withValues(alpha: 0.6),
                              width: 1.2,
                            ),
                          ),
                          child: Center(
                            child: Icon(p.icon, color: p.primaryColor, size: 22),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                p.title,
                                style: GoogleFonts.spaceGrotesk(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                p.company != null ? p.company! : p.subtitle,
                                style: GoogleFonts.outfit(
                                  color: p.company != null ? AppColors.flutterCyan : AppColors.textSecondary,
                                  fontSize: 11.5,
                                  fontWeight: p.company != null ? FontWeight.w600 : FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Status / Category Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: p.isLiveOnStores
                          ? AppColors.accentNeonGreen.withValues(alpha: 0.15)
                          : (p.hasBackend ? AppColors.flutterCyan.withValues(alpha: 0.15) : const Color(0x14FFFFFF)),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: p.isLiveOnStores
                            ? AppColors.accentNeonGreen.withValues(alpha: 0.5)
                            : (p.hasBackend ? AppColors.flutterCyan.withValues(alpha: 0.4) : const Color(0x22FFFFFF)),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (p.isLiveOnStores) ...[
                          const Icon(Icons.rocket_launch_rounded, size: 11, color: AppColors.accentNeonGreen),
                          const SizedBox(width: 4),
                        ] else if (p.hasBackend) ...[
                          const Icon(Icons.hub_rounded, size: 11, color: AppColors.flutterCyan),
                          const SizedBox(width: 4),
                        ],
                        Text(
                          p.isLiveOnStores ? "Play Store Live" : (p.hasBackend ? "Full-Stack" : p.category),
                          style: GoogleFonts.jetBrainsMono(
                            color: p.isLiveOnStores
                                ? AppColors.accentNeonGreen
                                : (p.hasBackend ? AppColors.flutterCyan : AppColors.textSecondary),
                            fontSize: 9.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Card Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Description
                    Text(
                      p.description,
                      style: GoogleFonts.outfit(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.45,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Tech Tags
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: p.techStack.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0x14FFFFFF),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tech,
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.flutterCyan,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    // Direct Action Links Bar (Play Store, App Repo, Backend API, Details)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        // Play Store Button (if live)
                        if (p.playStoreUrl != null)
                          ElevatedButton.icon(
                            onPressed: () => widget.onOpenUrl(p.playStoreUrl!),
                            icon: const Icon(Icons.shop_two_rounded, size: 13, color: Colors.black),
                            label: Text(
                              "Play Store",
                              style: GoogleFonts.spaceGrotesk(
                                color: Colors.black,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accentNeonGreen,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),

                        // Git App Repo Button (if available)
                        if (p.githubUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => widget.onOpenUrl(p.githubUrl!),
                            icon: const Icon(Icons.code_rounded, size: 13, color: Colors.white),
                            label: Text(
                              p.hasBackend ? "App Repo" : "GitHub",
                              style: GoogleFonts.spaceGrotesk(
                                color: Colors.white,
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0x33FFFFFF)),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),

                        // Backend API Repo Button (if available)
                        if (p.backendGithubUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => widget.onOpenUrl(p.backendGithubUrl!),
                            icon: const Icon(Icons.dns_rounded, size: 13, color: AppColors.accentNeonGreen),
                            label: Text(
                              "Backend API",
                              style: GoogleFonts.spaceGrotesk(
                                color: AppColors.accentNeonGreen,
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.accentNeonGreen, width: 1.0),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),

                        // Admin Panel Repo Button (if available)
                        if (p.adminGithubUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => widget.onOpenUrl(p.adminGithubUrl!),
                            icon: const Icon(Icons.admin_panel_settings_rounded, size: 13, color: Color(0xFF38BDF8)),
                            label: Text(
                              "Admin Repo",
                              style: GoogleFonts.spaceGrotesk(
                                color: const Color(0xFF38BDF8),
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0x6638BDF8), width: 1.0),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),

                        // View Details Modal Button
                        ElevatedButton.icon(
                          onPressed: widget.onDetailsTapped,
                          icon: const Icon(Icons.visibility_outlined, size: 13, color: Colors.black),
                          label: Text(
                            "Deep Dive",
                            style: GoogleFonts.spaceGrotesk(
                              color: Colors.black,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: p.primaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
