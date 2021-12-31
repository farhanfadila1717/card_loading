import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'card_loading_painter.dart';
part 'card_loading_theme.dart';

class CardLoading extends StatefulWidget {
  const CardLoading({
    Key? key,
    required this.height,
    this.width,
    this.margin,
    this.borderRadius = 10,
    this.animationDuration = const Duration(milliseconds: 750),
    this.animationDurationTwo = const Duration(milliseconds: 450),
    @Deprecated("This is no longer used, use CardLoadingTheme")
        this.colorOne = const Color(0xFFE5E5E5),
    @Deprecated("This is no longer used, use CardLoadingTheme")
        this.colorTwo = const Color(0xFFF0F0F0),
    this.cardLoadingTheme = const CardLoadingTheme(),
    this.curve = Curves.easeInOutSine,
    this.withChangeDuration = true,
  }) : super(key: key);

  /// height will be the size of [CardLoading]
  /// and this parameter is required
  final double height;

  /// width will be the size of [CardLoading]
  /// by default width will be [double.maxInfinite]
  final double? width;

  /// the class that is used to describe the padding dimensions.
  /// by default margin will be [EdgeInsets.zero]
  final EdgeInsets? margin;

  /// A radius for either circular or elliptical shapes.
  /// by default borderRadius is 15
  final double borderRadius;

  /// this will be the difference in [animationDuration] between [colorOne] and [colorTwo]
  /// if you don't want duration difference in animation duration change this property to false
  final bool withChangeDuration;

  /// animationDuration will be the duration of the animation duration
  /// from [Offset] (0, 0) to [Offset] (0, 1)
  /// default [animationDuration] is 750 milliseconds
  final Duration animationDuration;

  /// this will be the default duration of the second animation,
  /// if you change the [animationDuration], it is highly recommended to adjust this property
  final Duration animationDurationTwo;

  /// at the beginning this will be the [Color] for the background [CardLoading]
  /// default Color(0xFFF0F0F0)
  final Color colorOne;

  /// at the beginning this will be the [Color] for the Loading [CardLoading]
  /// default Color(0xFFF0F0F0)
  final Color colorTwo;

  final CardLoadingTheme cardLoadingTheme;

  // An parametric animation easing curve, i.e. a mapping of the unit interval to
  /// the unit interval.
  ///
  /// Easing curves are used to adjust the rate of change of an animation over
  /// time, allowing them to speed up and slow down, rather than moving at a
  /// constant rate.
  ///
  /// A [Curve] must map t=0.0 to 0.0 and t=1.0 to 1.0.
  ///
  /// See also:
  ///
  ///  * [Curves], a collection of common animation easing curves.
  ///  * [CurveTween], which can be used to apply a [Curve] to an [Animation].
  ///  * [Canvas.drawArc], which draws an arc, and has nothing to do with easing
  ///    curves.
  ///  * [Animatable], for a more flexible interface that maps fractions to
  ///    arbitrary values.
  final Curve curve;

  @override
  _CardLoadingState createState() => _CardLoadingState();
}

class _CardLoadingState extends State<CardLoading>
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
                  changeDuration();
                  _animationController.reset();
                  _animationController.forward();
                }
              }
            },
          );
    _initAnimation();
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
      _initAnimation();
    }
  }

  void _initAnimation({Curve? curve}) {
    _animation = CurvedAnimation(
        parent: _animationController, curve: curve ?? widget.curve);
  }

  /// this function will reverse the colors of colorOne and colorTwo
  /// to swap with each other, every time the animation is complete
  void reverseColor() {
    _animationController.reset();
    if (_isBackgroundOnTop) {
      _backgroudColor = widget.cardLoadingTheme.colorTwo;
      _loadingColor = widget.cardLoadingTheme.colorOne;
    } else {
      _backgroudColor = widget.cardLoadingTheme.colorOne;
      _loadingColor = widget.cardLoadingTheme.colorTwo;
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
      key: widget.key,
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
          );
        },
      ),
    );
  }
}
