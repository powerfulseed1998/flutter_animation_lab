import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise13Page extends StatelessWidget {
  const Exercise13Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '1-3',
      title: '选择合适方案',
      filePath: 'lib/exercises/chapter_01/exercise_1_3.dart',
      tasks: [
        '为按钮变色、无限旋转、跨页面图片分别选择 Flutter API。',
        '把你的选择和是否需要 Controller 写进界面。',
      ],
      child: _DecisionTable(),
    );
  }
}

class _DecisionTable extends StatelessWidget {
  const _DecisionTable();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 实现一个三行的选择表。
    // 提示：可使用 DataTable，列为“需求 / API / 需要 Controller”。
    return const StarterPlaceholder(message: 'TODO：实现动画方案选择表');
  }
}
