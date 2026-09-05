import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/url_launcher_service.dart';

mixin NavigationMixin on BaseViewModel {
  final NavigationService _navigationService = NavigationService();
  final UrlLauncherService _urlLauncherService = UrlLauncherService();

  NavigationService get navigationService => _navigationService;
  UrlLauncherService get urlLauncherService => _urlLauncherService;

  final ValueNotifier<int> activeNavIndexNotifier = ValueNotifier<int>(0);
  int get activeNavIndex => activeNavIndexNotifier.value;

  void setActiveNavIndex(int index) {
    if (activeNavIndexNotifier.value != index) {
      activeNavIndexNotifier.value = index;
    }
  }

  /// Smoothly scrolls to a designated GlobalKey section in the viewport
  void scrollToKey(GlobalKey key, {Duration duration = const Duration(milliseconds: 700)}) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: duration,
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      );
    }
  }

  /// Launch external web URL safely
  Future<void> openUrl(String url) async {
    await _urlLauncherService.launchURL(url);
  }

  /// Open default mail client
  Future<void> sendDirectEmail({required String email, String? subject, String? body}) async {
    await _urlLauncherService.sendEmail(email: email, subject: subject, body: body);
  }

  /// Copy text to clipboard and return success status
  Future<bool> copyToClipboard(String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
      return true;
    } catch (e) {
      debugPrint('Error copying to clipboard: $e');
      return false;
    }
  }

  /// Navigate to another route using Stacked NavigationService
  Future<dynamic>? navigateToRoute(String routeName, {dynamic arguments}) {
    return _navigationService.navigateTo(routeName, arguments: arguments);
  }

  /// Replace current route
  Future<dynamic>? replaceWithRoute(String routeName, {dynamic arguments}) {
    return _navigationService.replaceWith(routeName, arguments: arguments);
  }

}
