import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sudhar_portfolio/core/constants/app_strings.dart';
import 'package:sudhar_portfolio/core/mixins/navigation_mixin.dart';


class HomeViewModel extends BaseViewModel with NavigationMixin {
  final ScrollController scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  HomeViewModel() {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final offset = scrollController.offset;

    // Approximate active section by scroll offset
    if (offset < 550) {
      setActiveNavIndex(0);
    } else if (offset < 1300) {
      setActiveNavIndex(1);
    } else if (offset < 2300) {
      setActiveNavIndex(2);
    } else if (offset < 3100) {
      setActiveNavIndex(3);
    } else {
      setActiveNavIndex(4);
    }
  }

  void scrollToLevel(int index) {
    setActiveNavIndex(index);
    switch (index) {
      case 0:
        scrollToKey(heroKey);
        break;
      case 1:
        scrollToKey(skillsKey);
        break;
      case 2:
        scrollToKey(projectsKey);
        break;
      case 3:
        scrollToKey(experienceKey);
        break;
      case 4:
        scrollToKey(contactKey);
        break;
    }
  }

  void scrollToWork() => scrollToLevel(2);

  void scrollToContact() => scrollToLevel(4);

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
    setActiveNavIndex(0);
  }

  Future<void> handleOpenUrl(String url) async {
    await openUrl(url);
  }

  Future<void> handleSendEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    await sendDirectEmail(email: email, subject: subject, body: body);
  }

  Future<bool> handleCopyEmail(String email) async {
    return await copyToClipboard(email);
  }

  Future<void> handleDownloadResume() async {
    // Direct link to CV or GitHub portfolio
    await openUrl(AppStrings.githubUrl);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
