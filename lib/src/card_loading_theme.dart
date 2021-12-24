part of 'card_loading.dart';

class CardLoadingTheme {
  /// at the beginning this will be the [Color] for the background [CardLoading]
  /// default Color(0xFFE5E5E5)
  final Color colorOne;

  /// at the beginning this will be the [Color] for the Loading [CardLoading]
  /// default Color(0xFFF0F0F0)
  final Color colorTwo;

  const CardLoadingTheme({
    this.colorOne = const Color(0xFFE5E5E5),
    this.colorTwo = const Color(0xFFF0F0F0),
  });
}
