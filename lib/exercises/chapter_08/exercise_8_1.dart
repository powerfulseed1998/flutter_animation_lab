import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise81Page extends StatelessWidget {
  const Exercise81Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 根据 1200ms 和 Interval(.25, .75) 计算下面三个值。
    const startMs = 0;
    const endMs = 0;
    const durationMs = 0;
    return ExerciseWorkspace(
      exerciseId: '8-1',
      title: '计算实际时间',
      filePath: 'lib/exercises/chapter_08/exercise_8_1.dart',
      tasks: const [
        '计算 Interval(.25, .75) 在 1200ms 时间轴上的起止时间。',
        '用进度条或时间轴可视化该区间。',
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('开始：$startMs ms'),
          Text('结束：$endMs ms'),
          Text('持续：$durationMs ms'),
          const SizedBox(height: 16),
          const LinearProgressIndicator(value: .5),
        ],
      ),
    );
  }
}
