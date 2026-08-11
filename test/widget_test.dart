import 'package:flutter/material.dart';
import 'package:flutter_animation_lab/data/chapter_catalog.dart';
import 'package:flutter_animation_lab/demos/animation_demos.dart';
import 'package:flutter_animation_lab/main.dart';
import 'package:flutter_animation_lab/screens/chapter_page.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _harness(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: child),
    ),
  );
}

void main() {
  testWidgets('home has no layout overflow at mobile width', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const AnimationLabApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byKey(const ValueKey('chapter-card-1')), findsOneWidget);
  });

  testWidgets('home lists chapters and opens the first chapter', (tester) async {
    await tester.pumpWidget(const AnimationLabApp());

    expect(find.text('Flutter 动画实验室'), findsWidgets);
    expect(find.byKey(const ValueKey('chapter-card-1')), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('chapter-card-1')));
    await tester.pumpAndSettle();

    expect(find.text('第 1 章 · 动画核心与方案选择'), findsOneWidget);
    expect(find.text('知识'), findsOneWidget);
    expect(find.text('演示'), findsOneWidget);
    expect(find.text('练习'), findsOneWidget);
  });

  testWidgets('AnimatedSwitcher changes keyed counter child', (tester) async {
    await tester.pumpWidget(_harness(const SwitcherDemo()));

    expect(find.byKey(const ValueKey<int>(0)), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('increment-counter')));
    await tester.pump();
    expect(find.byKey(const ValueKey<int>(1)), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey<int>(0)), findsNothing);
    expect(find.byKey(const ValueKey<int>(1)), findsOneWidget);
  });

  testWidgets('exercise card opens its editable code workspace', (tester) async {
    await tester.pumpWidget(MaterialApp(home: ChapterPage(chapter: chapters.first)));

    await tester.tap(find.text('练习'));
    await tester.pumpAndSettle();
    final openButton = find.byKey(const ValueKey('open-exercise-1-1'));
    await tester.ensureVisible(openButton);
    await tester.tap(openButton);
    await tester.pumpAndSettle();

    expect(find.text('1-1 · 映射温度值'), findsOneWidget);
    expect(find.text('lib/exercises/chapter_01/exercise_1_1.dart'), findsOneWidget);
    expect(find.textContaining('进度：'), findsOneWidget);
  });

  testWidgets('implicit animation has deterministic midpoint and end', (tester) async {
    await tester.pumpWidget(_harness(const ImplicitAnimationDemo()));
    final box = find.byKey(const ValueKey('implicit-box'));

    expect(tester.getSize(box).width, closeTo(120, 0.1));
    await tester.tap(find.byKey(const ValueKey('toggle-implicit')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));
    expect(tester.getSize(box).width, inExclusiveRange(120, 240));

    await tester.pump(const Duration(milliseconds: 250));
    expect(tester.getSize(box).width, closeTo(240, 0.1));
  });

  testWidgets('controller supports forward and reset', (tester) async {
    await tester.pumpWidget(_harness(const ControllerDemo()));

    await tester.tap(find.byKey(const ValueKey('controller-forward')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 450));
    final status = tester.widget<Text>(find.byKey(const ValueKey('controller-status')));
    expect(status.data, contains('进度 0.50'));

    await tester.tap(find.byKey(const ValueKey('controller-reset')));
    await tester.pump();
    expect(find.textContaining('进度 0.00'), findsOneWidget);
  });

  testWidgets('AnimatedList inserts and removes synchronized items', (tester) async {
    await tester.pumpWidget(_harness(const StaggeredListDemo()));
    await tester.pump(const Duration(seconds: 1));

    final insertButton = find.byKey(const ValueKey('insert-list-item'));
    await tester.ensureVisible(insertButton);
    await tester.pumpAndSettle();
    tester.widget<FilledButton>(insertButton).onPressed!();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('新任务 3', skipOffstage: false), findsOneWidget);

    final removeButton = find.byKey(const ValueKey('remove-list-item'));
    await tester.ensureVisible(removeButton);
    tester.widget<OutlinedButton>(removeButton).onPressed!();
    await tester.pumpAndSettle();
    expect(find.text('同步数据索引', skipOffstage: false), findsNothing);
  });

  testWidgets('custom route opens Hero detail page', (tester) async {
    await tester.pumpWidget(_harness(const NavigationDemo()));

    await tester.tap(find.byKey(const ValueKey('open-hero-detail')));
    await tester.pumpAndSettle();

    expect(find.text('Hero 详情'), findsOneWidget);
    expect(find.textContaining('相同的 Hero tag'), findsOneWidget);
  });
}
