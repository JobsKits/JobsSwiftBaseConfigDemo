import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter/main.dart';

void main() {
  testWidgets('宿主窗口变化和键盘出现后输入保留，回传按钮可滚动到达', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(880, 600);
    tester.view.padding = const FakeViewPadding(
      left: 60,
      right: 12,
      bottom: 20,
    );
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(
        home: FlutterPage(
          args: {'requestId': 'resize-session', 'prefill': 'draft'},
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), 'resize draft');
    tester.view.physicalSize = const Size(320, 360);
    tester.view.padding = const FakeViewPadding(left: 12, right: 40);
    tester.view.viewInsets = const FakeViewPadding(bottom: 140);
    await tester.pumpAndSettle();

    expect(find.text('resize draft'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.ensureVisible(find.text('返回并回传给 iOS'));
    await tester.pumpAndSettle();
    expect(find.text('返回并回传给 iOS').hitTestable(), findsOneWidget);
    final rect = tester.getRect(find.byType(ElevatedButton));
    expect(rect.left, greaterThanOrEqualTo(12));
    expect(rect.right, lessThanOrEqualTo(280));
    expect(tester.takeException(), isNull);
  });
}
