import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize({
    double width = 150,
    double height = 100,
    double pixelDensity = 1,
  }) async {
    final size = Size(width, height);
    await this.binding.setSurfaceSize(size);
    view.physicalSize = size;
    view.devicePixelRatio = pixelDensity;
  }
}
