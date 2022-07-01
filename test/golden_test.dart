import 'package:card_loading/src/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const key = Key('box_key');
  const theme = CardLoadingTheme();

  Widget buildSubject(double progress) {
    return Container(
      key: key,
      width: 150,
      height: 100,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: CustomPaint(
        painter: CardLoadingPainter(
          colorOne: theme.colorOne,
          colorTwo: theme.colorTwo,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          progress: progress,
        ),
      ),
    );
  }

  group('CardLoadingPainter with matches golden file', () {
    testWidgets('matchess excepted with 0% progress', (tester) async {
      await tester.setScreenSize();
      await tester.pumpWidget(buildSubject(0.0));

      await expectLater(
        find.byKey(key),
        matchesGoldenFile('progress_zero.jpg'),
      );
    });

    testWidgets('matchess excepted with 50% progress', (tester) async {
      await tester.setScreenSize();
      await tester.pumpWidget(buildSubject(0.5));

      await expectLater(
        find.byKey(key),
        matchesGoldenFile('progress_half.jpg'),
      );
    });

    testWidgets('matchess excepted with 100% progress', (tester) async {
      await tester.setScreenSize();
      await tester.pumpWidget(buildSubject(1.0));

      await expectLater(
        find.byKey(key),
        matchesGoldenFile('progress_full.jpg'),
      );
    });
  });
}

extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize({
    double width = 150,
    double height = 100,
    double pixelDensity = 1,
  }) async {
    final size = Size(width, height);
    await this.binding.setSurfaceSize(size);
    this.binding.window.physicalSizeTestValue = size;
    this.binding.window.devicePixelRatioTestValue = pixelDensity;
  }
}
