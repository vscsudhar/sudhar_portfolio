import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';
import 'package:sudhar_portfolio/core/utils/pdf_download_helper.dart';
import 'package:sudhar_portfolio/core/utils/responsive_layout.dart';

class ResumeDialog extends StatefulWidget {
  const ResumeDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (context) => const ResumeDialog(),
    );
  }

  @override
  State<ResumeDialog> createState() => _ResumeDialogState();
}

class _ResumeDialogState extends State<ResumeDialog> {
  final TransformationController _transformationController = TransformationController();
  bool _isDownloading = false;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  Future<void> _handleDownload() async {
    setState(() => _isDownloading = true);
    try {
      await PdfDownloadHelper.downloadResume();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFF0F172A),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: AppColors.flutterCyan.withValues(alpha: 0.5)),
            ),
            content: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.accentNeonGreen, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Downloading Sudharsanan D's Resume PDF...",
                    style: GoogleFonts.spaceGrotesk(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isDownloading = false);
      }
    }
  }

  Future<void> _handleViewInNewTab() async {
    await PdfDownloadHelper.viewResumeInNewTab();
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    final dialogWidth = isMobile ? size.width * 0.94 : (size.width > 900 ? 820.0 : size.width * 0.9);
    final dialogHeight = isMobile ? size.height * 0.88 : size.height * 0.90;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 32,
        vertical: isMobile ? 16 : 24,
      ),
      child: Center(
        child: Container(
          width: dialogWidth,
          height: dialogHeight,
          decoration: BoxDecoration(
            color: const Color(0xFF0D131F),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.flutterCyan.withValues(alpha: 0.35),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.flutterCyan.withValues(alpha: 0.25),
                blurRadius: 36,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.8),
                blurRadius: 40,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header
              _buildHeader(isMobile),

              const Divider(height: 1, color: Color(0x1FFFFFFF)),

              // PDF Preview Canvas
              Expanded(
                child: Stack(
                  children: [
                    // Canvas / Interactive Viewer
                    Positioned.fill(
                      child: Container(
                        color: const Color(0xFF090D15),
                        child: ClipRRect(
                          child: InteractiveViewer(
                            transformationController: _transformationController,
                            minScale: 1.0,
                            maxScale: 3.5,
                            boundaryMargin: const EdgeInsets.all(40),
                            child: Center(
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.5),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    PdfDownloadHelper.assetPreviewImagePath,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 400,
                                        padding: const EdgeInsets.all(24),
                                        color: const Color(0xFF131B2A),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.picture_as_pdf_rounded,
                                                color: AppColors.flutterCyan,
                                                size: 50,
                                              ),
                                              const SizedBox(height: 16),
                                              Text(
                                                "Resume PDF Ready",
                                                style: GoogleFonts.spaceGrotesk(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "Click below to download or view the PDF",
                                                style: GoogleFonts.outfit(
                                                  color: AppColors.textSecondary,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Zoom reset badge helper
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0x33FFFFFF)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.pinch_rounded, color: AppColors.flutterCyan, size: 14),
                            const SizedBox(width: 6),
                            Text(
                              isMobile ? "Pinch to zoom" : "Scroll / Pinch to zoom",
                              style: GoogleFonts.spaceGrotesk(
                                color: AppColors.textSecondary,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: _resetZoom,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.flutterCyan.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "Reset",
                                  style: GoogleFonts.spaceGrotesk(
                                    color: AppColors.flutterCyan,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1, color: Color(0x1FFFFFFF)),

              // Footer Action Bar
              _buildFooter(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: 14,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.flutterCyan.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.flutterCyan.withValues(alpha: 0.3),
              ),
            ),
            child: const Icon(
              Icons.description_rounded,
              color: AppColors.flutterCyan,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "SUDHARSANAN D • RESUME",
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  "Flutter Developer | Mobile & Web Application Developer",
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    fontSize: isMobile ? 11 : 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close_rounded, color: Colors.white70),
            tooltip: "Close",
            splashRadius: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 24,
        vertical: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Close button
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_rounded, size: 16, color: AppColors.textSecondary),
            label: Text(
              "Back to Portfolio",
              style: GoogleFonts.spaceGrotesk(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Actions
          Wrap(
            spacing: 10,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Open in New Tab Button
              OutlinedButton.icon(
                onPressed: _handleViewInNewTab,
                icon: const Icon(Icons.open_in_new_rounded, size: 15, color: AppColors.flutterCyan),
                label: Text(
                  isMobile ? "View PDF" : "Open in New Tab",
                  style: GoogleFonts.spaceGrotesk(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.flutterCyan.withValues(alpha: 0.4)),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 18,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              // Download PDF Button
              ElevatedButton.icon(
                onPressed: _isDownloading ? null : _handleDownload,
                icon: _isDownloading
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                      )
                    : const Icon(Icons.download_rounded, size: 16, color: Colors.black),
                label: Text(
                  "Download PDF",
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.flutterCyan,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 14 : 22,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  shadowColor: AppColors.flutterCyan.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
