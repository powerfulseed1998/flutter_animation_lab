import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise42Page extends StatefulWidget {
  const Exercise42Page({super.key});

  @override
  State<Exercise42Page> createState() => _Exercise42PageState();
}

class _Exercise42PageState extends State<Exercise42Page> {
  double _score = 20;

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '4-2',
      title: '分数递增',
      filePath: 'lib/exercises/chapter_04/exercise_4_2.dart',
      tasks: const [
        '用 TweenAnimationBuilder 把当前显示值动画到 _score。',
        '动画过程显示为整数，连续点击不能跳回零。',
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO(学员): 用 TweenAnimationBuilder<double> 包住此 Text。
          Text(
            _score.round().toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          FilledButton(
            onPressed: () => setState(() => _score += 25),
            child: const Text('增加 25 分'),
          ),
        ],
      ),
    );
  }
}
