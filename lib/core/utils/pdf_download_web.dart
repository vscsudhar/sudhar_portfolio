// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class PdfDownloadImpl {
  static Future<void> downloadPdf({
    required String assetPath,
    required String webPath,
    required String filename,
  }) async {
    try {
      final anchor = html.AnchorElement(href: webPath)
        ..setAttribute('download', filename)
        ..target = '_blank'
        ..style.display = 'none';
      html.document.body?.children.add(anchor);
      anchor.click();
      anchor.remove();
    } catch (e) {
      debugPrint('Error triggering PDF download on web: $e');
    }
  }

  static Future<void> openPdfInNewTab({
    required String assetPath,
    required String webPath,
  }) async {
    try {
      html.window.open(webPath, '_blank');
    } catch (e) {
      debugPrint('Error opening PDF on web: $e');
    }
  }
}
