import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfDownloadImpl {
  static Future<void> downloadPdf({
    required String assetPath,
    required String webPath,
    required String filename,
  }) async {
    try {
      final uri = Uri.parse(webPath);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error downloading PDF on non-web: $e');
    }
  }

  static Future<void> openPdfInNewTab({
    required String assetPath,
    required String webPath,
  }) async {
    try {
      final uri = Uri.parse(webPath);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error opening PDF on non-web: $e');
    }
  }
}
