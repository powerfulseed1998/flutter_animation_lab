import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise43Page extends StatefulWidget {
  const Exercise43Page({super.key});

  @override
  State<Exercise43Page> createState() => _Exercise43PageState();
}

class _Exercise43PageState extends State<Exercise43Page> {
  double _target = 0.3;

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '4-3',
      title: '环形进度',
      filePath: 'lib/exercises/chapter_04/exercise_4_3.dart',
      tasks: const ['用一个 TweenAnimationBuilder 同时驱动进度环和百分比。', '目标变化时从当前显示值继续。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO(学员): 创建 TweenAnimationBuilder<double>，
          // 在同一个 builder 内构建 CircularProgressIndicator 和百分比 Text。
          Text('目标：${(_target * 100).round()}%'),
          Slider(
            value: _target,
            onChanged: (value) => setState(() => _target = value),
          ),
        ],
      ),
    );
  }
}
