import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';


class MobileDrawer extends StatelessWidget {
  final int activeIndex;
  final Function(int) onNavItemTapped;
  final VoidCallback onContactTapped;

  const MobileDrawer({
    super.key,
    required this.activeIndex,
    required this.onNavItemTapped,
    required this.onContactTapped,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {"name": AppStrings.navHero, "tag": "01", "icon": Icons.home_rounded},
      {"name": AppStrings.navAbout, "tag": "02", "icon": Icons.person_outline_rounded},
      {"name": AppStrings.navProjects, "tag": "03", "icon": Icons.rocket_launch_rounded},
      {"name": AppStrings.navJourney, "tag": "04", "icon": Icons.timeline_rounded},
      {"name": AppStrings.navContact, "tag": "05", "icon": Icons.mail_outline_rounded},
    ];


    return Drawer(
      backgroundColor: AppColors.surfaceElevated,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "S",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppStrings.developerName,
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Links List
              Expanded(
                child: ListView.separated(
                  itemCount: navItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = navItems[index];
                    final isActive = activeIndex == index;

                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pop();
                        onNavItemTapped(index);
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      tileColor: isActive ? AppColors.flutterCyan.withOpacity(0.12) : Colors.transparent,
                      leading: Icon(
                        item["icon"] as IconData,
                        color: isActive ? AppColors.flutterCyan : AppColors.textSecondary,
                        size: 20,
                      ),
                      title: Text(
                        item["name"] as String,
                        style: GoogleFonts.spaceGrotesk(
                          color: isActive ? AppColors.flutterCyan : Colors.white,
                          fontSize: 15,
                          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        item["tag"] as String,
                        style: GoogleFonts.jetBrainsMono(
                          color: isActive ? AppColors.flutterCyan : AppColors.textMuted,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Action CTA
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onContactTapped();
                  },
                  icon: const Icon(Icons.chat_bubble_outline_rounded, color: Colors.black, size: 16),
                  label: Text(
                    "Get in Touch",
                    style: GoogleFonts.spaceGrotesk(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.flutterCyan,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
