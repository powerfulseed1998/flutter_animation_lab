import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise14Page extends StatefulWidget {
  const Exercise14Page({super.key});

  @override
  State<Exercise14Page> createState() => _Exercise14PageState();
}

class _Exercise14PageState extends State<Exercise14Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 创建 linear、easeOutCubic、easeOutBack 三个 Animation<Offset>。
    // TODO(学员): 用三个 SlideTransition 显示相同距离的位移动画。
    return ExerciseWorkspace(
      exerciseId: '1-4',
      title: '制作曲线比较器',
      filePath: 'lib/exercises/chapter_01/exercise_1_4.dart',
      tasks: const ['三个动画必须共用 _controller。', '为每条轨道显示曲线名称，并支持重播。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const StarterPlaceholder(message: 'TODO：在这里放置三条动画轨道'),
          FilledButton(
            onPressed: () => _controller.forward(from: 0),
            child: const Text('重播'),
          ),
        ],
      ),
    );
  }
}
