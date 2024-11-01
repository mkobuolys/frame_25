import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frame_25/frame_25.dart';

void main() {
  group('Frame25', () {
    testWidgets('should show the 25th frame', (tester) async {
      const delay = Duration(seconds: 1);
      final frame25Delay = Duration(milliseconds: (1 / 24 * 1000).round());
      const text = '25th frame';

      await tester.pumpWidget(
        const MaterialApp(
          home: Frame25.delayed(
            delay: delay,
            frame25: Text(text),
            child: SizedBox.shrink(),
          ),
        ),
      );

      expect(find.text('25th frame'), findsNothing);

      await tester.pump(delay);

      expect(find.text('25th frame'), findsOneWidget);

      await tester.pump(frame25Delay);

      expect(find.text('25th frame'), findsNothing);
    });
  });
}
