import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise93Page extends StatelessWidget {
  const Exercise93Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '9-3',
      title: '确定性动画测试',
      filePath: 'test/exercises/chapter_09/exercise_9_3_test.dart',
      tasks: [
        '这道题请编辑上方 test 文件，而不是当前预览文件。',
        '验证 0ms、200ms、400ms 三个时点的宽度。',
        '只用 tester.pump(Duration)，不要真实等待。',
      ],
      child: StarterPlaceholder(
        message: '测试目标：点击按钮后，方块宽度在 400ms 内从 100 变为 240。',
        icon: Icons.science,
      ),
    );
  }
}

class WidthAnimationTarget extends StatefulWidget {
  const WidthAnimationTarget({super.key});

  @override
  State<WidthAnimationTarget> createState() => _WidthAnimationTargetState();
}

class _WidthAnimationTargetState extends State<WidthAnimationTarget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          key: const ValueKey('width-target'),
          duration: const Duration(milliseconds: 400),
          curve: Curves.linear,
          width: _expanded ? 240 : 100,
          height: 80,
          color: Colors.deepPurple,
        ),
        FilledButton(
          onPressed: () => setState(() => _expanded = true),
          child: const Text('展开'),
        ),
      ],
    );
  }
}
