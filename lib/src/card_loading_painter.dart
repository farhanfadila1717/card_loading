part of 'card_loading.dart';

/// [CardLoadingPainter] is a [CustomPainter]
/// that will draw every time there is an
/// update of the animation on [CardLoading].
class CardLoadingPainter extends CustomPainter {
  final Color colorOne;
  final Color colorTwo;
  final double progress;
  final double? borderRadius;

  const CardLoadingPainter({
    required this.colorOne,
    required this.colorTwo,
    required this.progress,
    this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final paintBackground = Paint()..color = colorOne;
    final pathBackground = Path()
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    final paint = Paint()..color = colorTwo;
    final path = Path()
      ..lineTo(0, height)
      ..lineTo(width * progress, height)
      ..lineTo(width * progress, 0)
      ..close();

    if (borderRadius != null && borderRadius! > 0) {
      final rRect = RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, width, height),
        Radius.circular(borderRadius!),
      );

      canvas.clipRRect(rRect);
    }
    canvas.drawPath(pathBackground, paintBackground);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
