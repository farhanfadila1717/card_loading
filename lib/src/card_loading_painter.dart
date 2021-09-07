part of 'card_loading.dart';

class CardLoadingPainter extends CustomPainter {
  final Color colorOne;
  final Color colorTwo;
  final double progress;

  const CardLoadingPainter(
      {required this.colorOne, required this.colorTwo, this.progress = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    var paint1 = Paint()..color = colorOne;
    var path1 = Path()
      ..moveTo(width * progress, 0)
      ..lineTo(width * progress, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    var paint2 = Paint()..color = colorTwo;
    var path2 = Path()
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
