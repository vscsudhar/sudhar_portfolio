import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dark Base
        Container(
          color: AppColors.background,
        ),

        // Animated Ambient Glowing Gradient Blobs
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final t = _controller.value * 2 * math.pi;
            return CustomPaint(
              size: MediaQuery.sizeOf(context),
              painter: _GlowBlobsPainter(
                progress: _controller.value,
                sineOffset: math.sin(t),
                cosineOffset: math.cos(t),
              ),
            );
          },
        ),

        // Subtle Tech Grid Overlay
        const Positioned.fill(
          child: CustomPaint(
            painter: _SubtleGridPainter(),
          ),
        ),

        // Foreground Content
        widget.child,
      ],
    );
  }
}

class _GlowBlobsPainter extends CustomPainter {
  final double progress;
  final double sineOffset;
  final double cosineOffset;

  _GlowBlobsPainter({
    required this.progress,
    required this.sineOffset,
    required this.cosineOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Blob 1: Cyan Glow (Top Right area)
    final blob1Center = Offset(
      w * 0.8 + sineOffset * 40,
      h * 0.15 + cosineOffset * 30,
    );
    final paint1 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.flutterCyan.withValues(alpha: 0.12),
          AppColors.flutterBlue.withValues(alpha: 0.06),
          Colors.transparent,
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(Rect.fromCircle(center: blob1Center, radius: math.min(w, h) * 0.45));

    canvas.drawCircle(blob1Center, math.min(w, h) * 0.45, paint1);

    // Blob 2: Indigo/Purple Glow (Mid Left area)
    final blob2Center = Offset(
      w * 0.15 - cosineOffset * 35,
      h * 0.45 + sineOffset * 45,
    );
    final paint2 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.accentIndigo.withValues(alpha: 0.10),
          AppColors.accentPurple.withValues(alpha: 0.04),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: blob2Center, radius: math.min(w, h) * 0.4));

    canvas.drawCircle(blob2Center, math.min(w, h) * 0.4, paint2);

    // Blob 3: Emerald/Cyan Glow (Bottom Right area)
    final blob3Center = Offset(
      w * 0.75 + cosineOffset * 30,
      h * 0.8 - sineOffset * 30,
    );
    final paint3 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.accentNeonGreen.withValues(alpha: 0.08),
          AppColors.flutterCyan.withValues(alpha: 0.03),
          Colors.transparent,
        ],
        stops: const [0.0, 0.4, 1.0],
      ).createShader(Rect.fromCircle(center: blob3Center, radius: math.min(w, h) * 0.35));

    canvas.drawCircle(blob3Center, math.min(w, h) * 0.35, paint3);
  }

  @override
  bool shouldRepaint(covariant _GlowBlobsPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _SubtleGridPainter extends CustomPainter {
  const _SubtleGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x08FFFFFF)
      ..strokeWidth = 1.0;

    const double step = 60.0;

    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
