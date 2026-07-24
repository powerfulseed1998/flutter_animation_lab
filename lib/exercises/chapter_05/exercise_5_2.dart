import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise52Page extends StatefulWidget {
  const Exercise52Page({super.key});

  @override
  State<Exercise52Page> createState() => _Exercise52PageState();
}

class _Exercise52PageState extends State<Exercise52Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '5-2',
      title: '旋转控制器',
      filePath: 'lib/exercises/chapter_05/exercise_5_2.dart',
      tasks: const ['用 RotationTransition 显示刷新图标。', '补全播放、暂停、重置三个按钮。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO(学员): 用 RotationTransition 包住图标，turns 传 _controller。
          const Icon(Icons.refresh, size: 72),
          Wrap(
            spacing: 8,
            children: [
              // TODO(学员): 分别调用 repeat、stop、reset。
              FilledButton(onPressed: () {}, child: const Text('播放')),
              OutlinedButton(onPressed: () {}, child: const Text('暂停')),
              TextButton(onPressed: () {}, child: const Text('重置')),
            ],
          ),
        ],
      ),
    );
  }
}
