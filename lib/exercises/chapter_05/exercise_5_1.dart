import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise51Page extends StatelessWidget {
  const Exercise51Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '5-1',
      title: 'Ticker 与释放',
      filePath: 'lib/exercises/chapter_05/exercise_5_1.dart',
      tasks: [
        '把 _LifecycleStarter 改为 StatefulWidget。',
        '混入 SingleTickerProviderStateMixin，并创建 Controller。',
        '在 dispose 中释放 Controller。',
      ],
      child: _LifecycleStarter(),
    );
  }
}

class _LifecycleStarter extends StatelessWidget {
  const _LifecycleStarter();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 在这个类中完成 Controller 的完整生命周期。
    return const StarterPlaceholder(
      message: 'TODO：创建、使用并释放 AnimationController',
    );
  }
}
