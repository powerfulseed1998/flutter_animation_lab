import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise53Page extends StatefulWidget {
  const Exercise53Page({super.key});

  @override
  State<Exercise53Page> createState() => _Exercise53PageState();
}

class _Exercise53PageState extends State<Exercise53Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 创建 opacity(.45→1) 和 scale(.9→1.08) 两个动画。
    // TODO(学员): 组合 FadeTransition、ScaleTransition，并实现往返循环。
    return ExerciseWorkspace(
      exerciseId: '5-3',
      title: '往返呼吸灯',
      filePath: 'lib/exercises/chapter_05/exercise_5_3.dart',
      tasks: const ['透明度和缩放共用一个 Controller。', '暂停后再次播放应从当前进度继续。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lightbulb, size: 80, color: Colors.amber),
          FilledButton(
            onPressed: () => _controller.repeat(reverse: true),
            child: const Text('开始'),
          ),
          TextButton(onPressed: _controller.stop, child: const Text('暂停')),
        ],
      ),
    );
  }
}
