import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise41Page extends StatelessWidget {
  const Exercise41Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '4-1',
      title: '何时使用 Builder',
      filePath: 'lib/exercises/chapter_04/exercise_4_1.dart',
      tasks: [
        '实现两个小 Demo：目标值动画与可暂停动画。',
        '前者使用 TweenAnimationBuilder，后者使用 AnimationController。',
        '在代码注释里写出选择理由。',
      ],
      child: _Comparison(),
    );
  }
}

class _Comparison extends StatelessWidget {
  const _Comparison();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 用 Row 或 Column 放置两个可操作 Demo。
    return const StarterPlaceholder(message: 'TODO：比较自动目标动画与显式控制动画');
  }
}
