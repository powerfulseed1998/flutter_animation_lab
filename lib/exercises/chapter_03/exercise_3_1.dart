import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise31Page extends StatefulWidget {
  const Exercise31Page({super.key});

  @override
  State<Exercise31Page> createState() => _Exercise31PageState();
}

class _Exercise31PageState extends State<Exercise31Page> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '3-1',
      title: 'Key 为什么重要',
      filePath: 'lib/exercises/chapter_03/exercise_3_1.dart',
      tasks: const [
        '先运行当前代码，观察数字为什么没有切换动画。',
        '只修改一行：为 Text 添加 ValueKey(count)。',
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            // TODO(学员): 给下面的 Text 添加 key: ValueKey(_count)。
            child: Text(
              '$_count',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => setState(() => _count++),
            child: const Text('增加'),
          ),
        ],
      ),
    );
  }
}
