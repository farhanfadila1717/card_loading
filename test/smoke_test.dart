import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'CardLoadingTest',
    () {
      testWidgets(
        'Default CardLoading test',
        (tester) async {
          await tester.pumpWidget(
            const Center(
              child: CardLoading(
                key: Key('CardLoadingKey'),
                height: 50,
                width: 50,
              ),
            ),
          );
          final card = find.byType(CardLoading);

          expect(card, findsOneWidget);
          expect(tester.getSize(card), Size.square(50));
        },
      );

      testWidgets(
        'has Padding all 10 px',
        (tester) async {
          await tester.pumpWidget(
            const Center(
              child: CardLoading(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(10),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          );
          final card = find.byType(CardLoading);
          expect(card, findsOneWidget);
          expect(tester.getSize(card), Size.square(70));
        },
      );
    },
  );
}
