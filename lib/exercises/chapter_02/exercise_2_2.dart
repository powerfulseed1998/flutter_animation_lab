import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise22Page extends StatefulWidget {
  const Exercise22Page({super.key});

  @override
  State<Exercise22Page> createState() => _Exercise22PageState();
}

class _Exercise22PageState extends State<Exercise22Page> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '2-2',
      title: '收藏按钮反馈',
      filePath: 'lib/exercises/chapter_02/exercise_2_2.dart',
      tasks: const [
        '补全 AnimatedRotation 和 AnimatedScale 的目标值。',
        '时长不超过 400ms，选中时使用 easeOutBack。',
      ],
      child: Center(
        child: IconButton(
          onPressed: () => setState(() => _selected = !_selected),
          // TODO(学员): 在 Icon 外组合 AnimatedRotation 与 AnimatedScale。
          icon: Icon(
            _selected ? Icons.favorite : Icons.favorite_border,
            size: 56,
            color: _selected ? Colors.red : null,
          ),
        ),
      ),
    );
  }
}
