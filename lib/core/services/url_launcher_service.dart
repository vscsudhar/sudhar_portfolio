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
    final query = <String>[];
    if (subject != null && subject.isNotEmpty) {
      query.add('subject=${Uri.encodeComponent(subject)}');
    }
    if (body != null && body.isNotEmpty) {
      query.add('body=${Uri.encodeComponent(body)}');
    }
    final queryString = query.isEmpty ? '' : '?${query.join('&')}';
    final emailUri = Uri.parse('mailto:$email$queryString');
    
    try {
      return await launchUrl(emailUri);
    } catch (e) {
      debugPrint('Error sending email: $e');
      return false;
    }
  }
}
