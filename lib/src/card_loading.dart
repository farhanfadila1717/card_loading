import 'package:flutter/material.dart';

part 'card_loading_painter.dart';
part 'card_loading_theme.dart';

/// {@template card_loading}
/// The `CardLoading` widget is used to create an easy animation
/// between two colors.
/// Example usage:
///
/// ```dart
/// CardLoading(
///   height: 100,
///   animationDuration: Duration(milliseconds: 500),
///   cardLoadingTheme: CardLoadingTheme(
///     colorOne: Colors.blue,
///     colorTwo: Colors.lightBlue,
///   ),
/// )
/// ```
/// {@endtemplate}
class CardLoading extends StatefulWidget {
  /// {@macro card_loading}
  const CardLoading({
    Key? key,
    required this.height,
    this.width,
    this.child,
    this.margin,
    this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 750),
    this.animationDurationTwo = const Duration(milliseconds: 450),
    this.cardLoadingTheme = CardLoadingTheme.defaultTheme,
    this.curve = Curves.easeInOutSine,
    this.withChangeDuration = true,
  }) : super(key: key);

  /// `height` is the height of the `CardLoading` widget and is required.
  final double height;

  /// `width` is the width of the `CardLoading` widget and has a default value of `double.maxInfinite`.
  final double? width;

  /// `margin` is the padding around the widget and has a default value of `EdgeInsets.zero`.
  final EdgeInsets? margin;

  /// `child` is the widget below the `CardLoading` widget in the widget tree.
  final Widget? child;

  /// `borderRadius` is the radius for either circular
  /// or elliptical shapes and has a default value of `null`.
  final BorderRadius? borderRadius;

  /// `withChangeDuration` determines if there is a difference in
  /// the `animationDuration` between `colorOne` and `colorTwo`.
  final bool withChangeDuration;

  /// `animationDuration` is the duration of the animation from
  /// `Offset` (0, 0) to `Offset` (0, 1) and has a default value of `750 milliseconds`.
  final Duration animationDuration;

  /// `animationDurationTwo` is the duration of the second animation and has a default value of `450 milliseconds`.
  final Duration animationDurationTwo;

  /// `CardLoadingTheme` is used to set the custom color for the `CardLoading` widget.
  final CardLoadingTheme cardLoadingTheme;

  /// The curve to use in the forward direction.
  final Curve curve;

  @override
  _CardLoadingState createState() => _CardLoadingState();
}

class _CardLoadingState extends State<CardLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Color _backgroudColor, _loadingColor;
  bool _isBackgroundOnTop = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    initAnimation();
    listenAnimation();
    _backgroudColor = widget.cardLoadingTheme.colorOne;
    _loadingColor = widget.cardLoadingTheme.colorTwo;
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant CardLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cardLoadingTheme != widget.cardLoadingTheme) {
      _loadingColor = widget.cardLoadingTheme.colorOne;
      _backgroudColor = widget.cardLoadingTheme.colorTwo;
    }
    if ((widget.animationDuration != oldWidget.animationDuration) ||
        (widget.curve != oldWidget.curve)) {
      initAnimation();
    }
  }

  void initAnimation({Curve? curve}) {
    _animation = CurvedAnimation(
        parent: _animationController, curve: curve ?? widget.curve);
  }

  void listenAnimation() {
    _animationController.addStatusListener((status) {
      if (!mounted) return;
      if (_animationController.isCompleted) {
        changeDuration();
        reverseColor();
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  /// this function will reverse the colors of colorOne and colorTwo
  /// to swap with each other, every time the animation is complete
  void reverseColor() {
    final theme = widget.cardLoadingTheme;
    if (_isBackgroundOnTop) {
      _backgroudColor = theme.colorTwo;
      _loadingColor = theme.colorOne;
    } else {
      _backgroudColor = theme.colorOne;
      _loadingColor = theme.colorTwo;
    }
    setState(() {
      _isBackgroundOnTop = !_isBackgroundOnTop;
    });
  }

  void changeDuration() {
    if (widget.withChangeDuration) {
      if (_isBackgroundOnTop) {
        _animationController.duration = widget.animationDurationTwo;
      } else {
        _animationController.duration = widget.animationDuration;
      }
    } else {
      int currentDurationMilliseconds =
          _animationController.duration?.inMilliseconds ?? 0;
      int expectDuration = widget.animationDuration.inMilliseconds;
      if (currentDurationMilliseconds != expectDuration) {
        _animationController.duration = widget.animationDuration;
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, snapshot) {
          return CustomPaint(
            painter: CardLoadingPainter(
              colorOne: _loadingColor,
              colorTwo: _backgroudColor,
              progress: _animation.value,
              borderRadius: widget.borderRadius,
            ),
            size: Size(widget.width ?? double.maxFinite, widget.height),
            child: widget.child,
          );
        },
      ),
    );
  }
}
