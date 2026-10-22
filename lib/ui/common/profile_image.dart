import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sudhar_portfolio/core/constants/app_colors.dart';

class ProfileImage extends StatefulWidget {
  final double size;
  final double borderRadius;
  final Offset mouseOffset;

  const ProfileImage({
    super.key,
    this.size = 200,
    this.borderRadius = 28,
    this.mouseOffset = Offset.zero,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? _resolvedAssetPath;
  bool _checkedAsset = false;

  final List<String> _candidatePaths = [
    'assets/images/profile/profile.jpg',
    'assets/images/profile/profile.png',
    'assets/images/profile/profile.jpeg',
    'assets/images/profile/profile.webp',
  ];

  @override
  void initState() {
    super.initState();
    _checkProfileAsset();
  }

  Future<void> _checkProfileAsset() async {
    for (final path in _candidatePaths) {
      try {
        await rootBundle.load(path);
        if (mounted) {
          setState(() {
            _resolvedAssetPath = path;
            _checkedAsset = true;
          });
          return;
        }
      } catch (_) {
        // Asset not present, continue checking candidates
      }
    }
    if (mounted) {
      setState(() {
        _resolvedAssetPath = null;
        _checkedAsset = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tiltX = -widget.mouseOffset.dy * 0.05;
    final tiltY = widget.mouseOffset.dx * 0.05;

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(tiltX)
        ..rotateY(tiltY),
      alignment: Alignment.center,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          gradient: const LinearGradient(
            colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: AppColors.flutterCyan.withValues(alpha: 0.45),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.flutterCyan.withValues(alpha: 0.25),
              blurRadius: 28,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: AppColors.accentIndigo.withValues(alpha: 0.2),
              blurRadius: 36,
              spreadRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius - 2),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background subtle gradient
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0F172A), Color(0xFF0B0F19)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              // Image or Intentional Fallback Icon
              if (_checkedAsset && _resolvedAssetPath != null)
                Image.asset(
                  _resolvedAssetPath!,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: widget.size,
                  height: widget.size,
                  errorBuilder: (context, error, stackTrace) => _buildFallback(),
                )
              else
                _buildFallback(),

              // Ambient Corner Glow Overlay
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: widget.size * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.flutterCyan.withValues(alpha: 0.18),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallback() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(widget.size * 0.12),
            decoration: BoxDecoration(
              color: AppColors.flutterCyan.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.flutterCyan.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Icon(
              Icons.person_rounded,
              size: widget.size * 0.38,
              color: AppColors.flutterCyan,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0x1AFFFFFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "SUDHARSANAN D",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
