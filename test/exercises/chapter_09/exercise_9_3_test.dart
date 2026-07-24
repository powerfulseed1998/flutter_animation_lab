import 'package:flutter/material.dart';
import 'package:flutter_animation_lab/exercises/chapter_09/exercise_9_3.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    '宽度在 0ms、200ms、400ms 时符合预期',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: WidthAnimationTarget())),
      );

      final target = find.byKey(const ValueKey('width-target'));

      // TODO(学员): 在点击前断言宽度为 100。
      // TODO(学员): 点击“展开”并 pump() 启动动画。
      // TODO(学员): pump 200ms，断言宽度位于 100 和 240 之间。
      // TODO(学员): 再 pump 200ms，断言最终宽度为 240。
      expect(target, findsOneWidget);
    },
    // TODO(学员): 完成断言后删除本行的 skip 参数。
    skip: true,
  );
}
