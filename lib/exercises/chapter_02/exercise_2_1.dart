import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise21Page extends StatelessWidget {
  const Exercise21Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '2-1',
      title: '隐式动画判断',
      filePath: 'lib/exercises/chapter_02/exercise_2_1.dart',
      tasks: [
        '实现一个可点击的选中态卡片。',
        '只使用隐式动画，不创建 AnimationController。',
        '在代码注释中说明这样选择的原因。',
      ],
      child: _SelectableCard(),
    );
  }
}

class _SelectableCard extends StatelessWidget {
  const _SelectableCard();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 把本组件改成 StatefulWidget，并用 AnimatedContainer
    // 实现背景色、边框和尺寸的选中态过渡。
    return const StarterPlaceholder(message: 'TODO：实现无 Controller 的选中态卡片');
  }
}
