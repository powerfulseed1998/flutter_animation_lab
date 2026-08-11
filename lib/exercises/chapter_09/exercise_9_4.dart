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
        '复用静态子树，并在合适处支持 disableAnimations。',
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
    // TODO(学员): 重构此动画实现；必要时改用更合适的 API，并复用静态 child。
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
