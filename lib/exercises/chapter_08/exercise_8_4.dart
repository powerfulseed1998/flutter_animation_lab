import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise84Page extends StatelessWidget {
  const Exercise84Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '8-4',
      title: '可重排任务板',
      filePath: 'lib/exercises/chapter_08/exercise_8_4.dart',
      tasks: [
        '实现快速连续插入、删除仍不会越界的任务板。',
        '每项使用稳定数据 Key。',
        '空列表状态使用 AnimatedSwitcher。',
      ],
      child: _TaskBoard(),
    );
  }
}

class _TaskBoard extends StatelessWidget {
  const _TaskBoard();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 改成 StatefulWidget，自行选择 AnimatedList 或 AnimatedGrid。
    return const StarterPlaceholder(message: 'TODO：实现支持连续操作和空状态的任务板');
  }
}
