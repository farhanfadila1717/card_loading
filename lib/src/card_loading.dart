import 'package:flutter/material.dart';

part 'card_loading_painter.dart';

class CardLoading extends StatefulWidget {
  const CardLoading({
    Key? key,
    required this.height,
    this.width,
    this.padding,
    this.borderRadius = 10,
    this.animationDuration = const Duration(milliseconds: 750),
    this.colorOne = const Color(0xFFE5E5E5),
    this.colorTwo = const Color(0xFFF0F0F0),
    this.curve = Curves.easeInOutSine,
  }) : super(key: key);

  final double height;
  final double? width;
  final EdgeInsets? padding;
  final double borderRadius;
  final Duration animationDuration;
  final Color colorOne;
  final Color colorTwo;
  final Curve curve;

  @override
  _LoadingCardState createState() => _LoadingCardState();
}

class _LoadingCardState extends State<CardLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Color _backgroudColor, _loadingColor;

  bool _isBackgroundOnTop = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration)
          ..addListener(
            () {
              if (mounted) {
                if (_animationController.isCompleted) {
                  reverseColor();
                  _animationController.reset();
                  _animationController.forward();
                }
              }
            },
          );
    _initAnimation();
    _backgroudColor = widget.colorTwo;
    _loadingColor = widget.colorOne;
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant CardLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.colorOne != widget.colorOne) {
      _loadingColor = widget.colorOne;
    }
    if (oldWidget.colorTwo != widget.colorTwo) {
      _backgroudColor = widget.colorTwo;
    }
    if ((widget.animationDuration != oldWidget.animationDuration) ||
        (widget.curve != oldWidget.curve)) {
      _initAnimation();
    }
  }

  void _initAnimation() {
    _animation =
        CurvedAnimation(parent: _animationController, curve: widget.curve);
  }

  void reverseColor() {
    if (_isBackgroundOnTop) {
      _backgroudColor = widget.colorTwo;
      _loadingColor = widget.colorOne;
    } else {
      _backgroudColor = widget.colorOne;
      _loadingColor = widget.colorTwo;
    }
    setState(() {
      _isBackgroundOnTop = !_isBackgroundOnTop;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: widget.key,
      padding: widget.padding ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: CardLoadingPainter(
                colorOne: _loadingColor,
                colorTwo: _backgroudColor,
                progress: _animation.value,
              ),
              size: Size(widget.width ?? double.maxFinite, widget.height),
            );
          },
        ),
      ),
    );
  }
}
