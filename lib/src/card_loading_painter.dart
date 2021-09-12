part of 'card_loading.dart';

/// [CardLoadingPainter] is a [CustomPainter]
/// that will draw every time there is an
/// update of the animation on [CardLoading].
class CardLoadingPainter extends CustomPainter {
  final Color colorOne;
  final Color colorTwo;
  final double progress;
  final double borderRadius;

  const CardLoadingPainter({
    required this.colorOne,
    required this.colorTwo,
    required this.progress,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    var paintBackground = Paint()..color = colorOne;

    var paint = Paint()..color = colorTwo;
    var path = Path()
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    RRect rrectBackgorund = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2), width: width, height: height),
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rrectBackgorund, paintBackground);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
