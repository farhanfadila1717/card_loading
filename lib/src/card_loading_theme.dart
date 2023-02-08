part of 'card_loading.dart';

/// {@template card_loading_theme}
///
/// The `CardLoadingTheme` class defines the visual appearance of a loading card.
///
/// This class takes in two `Color` parameters, `colorOne` and `colorTwo`,
/// which are used to set the background color of the card during its loading state.
///
/// Example usage:
///
/// ```dart
/// CardLoadingTheme(
///   colorOne: Colors.lightBlue,
///   colorTwo: Colors.blue,
/// )
/// ```
///
/// {@endtemplate}
class CardLoadingTheme {
  /// at the beginning this will be the [Color] for the background [CardLoading]
  /// default Color(0xFFE5E5E5)
  final Color colorOne;

  /// at the beginning this will be the [Color] for the Loading [CardLoading]
  /// default Color(0xFFF0F0F0)
  final Color colorTwo;

  /// {@macro card_loading_theme}
  const CardLoadingTheme({
    required this.colorOne,
    required this.colorTwo,
  });

  static const CardLoadingTheme defaultTheme = CardLoadingTheme(
    colorOne: const Color(0xFFE5E5E5),
    colorTwo: const Color(0xFFF0F0F0),
  );
}
