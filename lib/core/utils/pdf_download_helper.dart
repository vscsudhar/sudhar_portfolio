import 'pdf_download_stub.dart'
    if (dart.library.html) 'pdf_download_web.dart';

class PdfDownloadHelper {
  static const String webPdfPath = 'resume.pdf';
  static const String assetPdfPath = 'assets/docs/resume.pdf';
  static const String assetPreviewImagePath = 'assets/docs/resume_preview.png';
  static const String downloadFileName = 'Sudharsanan_D_Flutter_Developer_Resume.pdf';

  /// Initiates browser or system download for the resume PDF
  static Future<void> downloadResume() async {
    await PdfDownloadImpl.downloadPdf(
      assetPath: assetPdfPath,
      webPath: webPdfPath,
      filename: downloadFileName,
    );
  }

  /// Opens the PDF directly in a new tab or external viewer
  static Future<void> viewResumeInNewTab() async {
    await PdfDownloadImpl.openPdfInNewTab(
      assetPath: assetPdfPath,
      webPath: webPdfPath,
    );
  }
}
