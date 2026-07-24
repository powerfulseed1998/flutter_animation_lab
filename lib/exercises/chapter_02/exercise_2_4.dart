import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise24Page extends StatelessWidget {
  const Exercise24Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '2-4',
      title: '可展开资料卡',
      filePath: 'lib/exercises/chapter_02/exercise_2_4.dart',
      tasks: [
        '组合 AnimatedContainer、AnimatedAlign 和 AnimatedDefaultTextStyle。',
        '折叠和展开都不能出现布局溢出。',
      ],
      child: _ExpandableProfileCard(),
    );
  }
}

class _ExpandableProfileCard extends StatelessWidget {
  const _ExpandableProfileCard();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 改成 StatefulWidget，创建 expanded 状态并完成三个隐式动画。
    return const StarterPlaceholder(message: 'TODO：实现可展开资料卡');
  }
}
