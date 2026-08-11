import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise61Page extends StatelessWidget {
  const Exercise61Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '6-1',
      title: 'Offset 的单位',
      filePath: 'lib/exercises/chapter_06/exercise_6_1.dart',
      tasks: [
        '并排实现 SlideTransition 与 Transform.translate。',
        '前者使用 Offset(0, 1)，后者移动固定 100px。',
        '提供可调节 child 高度的控件，对比两种位移单位。',
      ],
      child: _OffsetComparison(),
    );
  }
}

class _OffsetComparison extends StatelessWidget {
  const _OffsetComparison();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 创建可重播动画并展示相对尺寸偏移与像素偏移。
    return const StarterPlaceholder(message: 'TODO：比较相对 Offset 与固定像素');
  }
}
