import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<bool> launchURL(String urlString) async {
    try {
      final uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        debugPrint('Could not launch $urlString');
        return false;
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      return false;
    }
  }

  Future<bool> sendEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    final mailtoUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null && subject.isNotEmpty) 'subject': subject,
        if (body != null && body.isNotEmpty) 'body': body,
      },
    );

    // Gmail Web Composer URL: creates a new compose mail window directly addressed to email
    final gmailWebUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1&to=$email'
      '${subject != null ? '&su=${Uri.encodeComponent(subject)}' : ''}'
      '${body != null ? '&body=${Uri.encodeComponent(body)}' : ''}',
    );

    if (kIsWeb) {
      // In web browsers, Gmail Web Compose is the most reliable way to guarantee
      // a compose window opens with recipient, subject and body pre-filled.
      try {
        final launched = await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
        if (launched) return true;
      } catch (e) {
        debugPrint('Error launching Gmail web composer: $e');
      }

      // Fallback to mailto
      try {
        return await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
      } catch (e) {
        debugPrint('Error launching mailto on web: $e');
        return false;
      }
    } else {
      // Mobile / Desktop native: open default email app via mailto
      try {
        if (await canLaunchUrl(mailtoUri)) {
          return await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
        }
      } catch (e) {
        debugPrint('Error launching mailto on native: $e');
      }

      // Fallback to Gmail Web Composer if no local email client is configured
      try {
        return await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
      } catch (e) {
        debugPrint('Error launching fallback Gmail composer: $e');
        return false;
      }
    }
  }
}
