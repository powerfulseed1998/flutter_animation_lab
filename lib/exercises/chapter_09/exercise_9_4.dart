import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise94Page extends StatelessWidget {
  const Exercise94Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '9-4',
      title: '动画代码审查',
      filePath: 'lib/exercises/chapter_09/exercise_9_4.dart',
      tasks: [
        '阅读 _ReviewTarget 并直接重构代码。',
        '从生命周期、性能、语义、可测试性四方面添加 REVIEW 注释。',
        '保留必要优化，删除没有依据的复杂度。',
      ],
      child: _ReviewTarget(),
    );
  }
}

class _ReviewTarget extends StatelessWidget {
  const _ReviewTarget();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): REVIEW 1（生命周期）：这个效果是否真的需要 Controller？
    // TODO(学员): REVIEW 2（性能）：静态图标是否应每次重新创建？
    // TODO(学员): REVIEW 3（语义）：状态变化如何让辅助技术感知？
    // TODO(学员): REVIEW 4（测试）：应增加哪些 Key 和确定性时点？
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (_, value, _) => Opacity(
        opacity: value,
        child: Transform.scale(
          scale: .8 + value * .2,
          child: const Icon(Icons.rate_review, size: 80),
        ),
      ),
    );
  }
}
