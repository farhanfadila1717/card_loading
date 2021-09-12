part of 'card_loading.dart';

/// [CardLoadingPainter] is a [CustomPainter]
/// that will draw every time there is an
/// update of the animation on [CardLoading].
class CardLoadingPainter extends CustomPainter {
  final Color colorOne;
  final Color colorTwo;
  final double progress;

  const CardLoadingPainter({
    required this.colorOne,
    required this.colorTwo,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    var paintBackground = Paint()..color = colorOne;
    var pathBackground = Path()
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    var paint = Paint()..color = colorTwo;
    var path = Path()
      ..lineTo(0, height)
      ..lineTo(width * progress, height)
      ..lineTo(width * progress, 0)
      ..close();

    canvas.drawPath(pathBackground, paintBackground);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
