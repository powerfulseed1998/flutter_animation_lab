import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise74Page extends StatelessWidget {
  const Exercise74Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '7-4',
      title: '卡片展开转场',
      filePath: 'lib/exercises/chapter_07/exercise_7_4.dart',
      tasks: [
        '组合 Hero、flightShuttleBuilder 和页面淡入。',
        '飞行过程中插值卡片圆角。',
        '快速返回时不能报错或闪烁。',
      ],
      child: _ExpandingCard(),
    );
  }
}

class _ExpandingCard extends StatelessWidget {
  const _ExpandingCard();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 改成可点击卡片，并实现列表页与详情页。
    // 在 Hero.flightShuttleBuilder 中根据动画值插值圆角。
    return const StarterPlaceholder(message: 'TODO：实现带圆角插值的 Hero 卡片转场');
  }
}
