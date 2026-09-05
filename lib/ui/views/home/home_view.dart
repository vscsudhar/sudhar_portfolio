import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/animated_background.dart';
import 'home_viewmodel.dart';
import 'widgets/level1_hero/level1_hero.dart';
import 'widgets/level2_skills/level2_skills.dart';
import 'widgets/level3_projects/level3_projects.dart';
import 'widgets/level4_experience/level4_experience.dart';
import 'widgets/level5_contact/level5_contact.dart';
import 'widgets/navbar/mobile_drawer.dart';
import 'widgets/navbar/navbar.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      endDrawer: ValueListenableBuilder<int>(
        valueListenable: viewModel.activeNavIndexNotifier,
        builder: (context, activeIndex, _) => MobileDrawer(
          activeIndex: activeIndex,
          onNavItemTapped: viewModel.scrollToLevel,
          onContactTapped: viewModel.scrollToContact,
        ),
      ),
      body: AnimatedBackground(
        child: Stack(
          children: [
            // Main Scrollable Sections
            Positioned.fill(
              child: SingleChildScrollView(
                controller: viewModel.scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Spacing for top sticky navbar
                    const SizedBox(height: 70),

                    // LEVEL 1: HERO
                    Container(
                      key: viewModel.heroKey,
                      child: Level1Hero(
                        onViewWorkTapped: viewModel.scrollToWork,
                        onContactTapped: viewModel.scrollToContact,
                        onDownloadResumeTapped: viewModel.handleDownloadResume,
                      ),
                    ),

                    // LEVEL 2: SKILLS / SPECIALTIES
                    Container(
                      key: viewModel.skillsKey,
                      child: const Level2Skills(),
                    ),

                    // LEVEL 3: FEATURED SHOWCASES
                    Container(
                      key: viewModel.projectsKey,
                      child: Level3Projects(
                        onOpenUrl: viewModel.handleOpenUrl,
                      ),
                    ),

                    // LEVEL 4: EXPERIENCE & IMPACT
                    Container(
                      key: viewModel.experienceKey,
                      child: const Level4Experience(),
                    ),

                    // LEVEL 5: CONTACT & FOOTER
                    Container(
                      key: viewModel.contactKey,
                      child: Level5Contact(
                        onOpenUrl: viewModel.handleOpenUrl,
                        onSendEmail: viewModel.handleSendEmail,
                        onCopyEmail: viewModel.handleCopyEmail,
                        onBackToTop: viewModel.scrollToTop,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Sticky Top Navbar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ValueListenableBuilder<int>(
                valueListenable: viewModel.activeNavIndexNotifier,
                builder: (context, activeIndex, _) => Navbar(
                  activeIndex: activeIndex,
                  onNavItemTapped: viewModel.scrollToLevel,
                  onContactTapped: viewModel.scrollToContact,
                  onOpenDrawer: () => scaffoldKey.currentState?.openEndDrawer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
