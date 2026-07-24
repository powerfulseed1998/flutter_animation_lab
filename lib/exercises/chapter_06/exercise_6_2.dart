import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise62Page extends StatefulWidget {
  const Exercise62Page({super.key});

  @override
  State<Exercise62Page> createState() => _Exercise62PageState();
}

class _Exercise62PageState extends State<Exercise62Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 创建 easeOutCubic 曲线和 Offset(0, .5)→zero 的位置动画。
    // TODO(学员): 组合 FadeTransition 与 SlideTransition。
    return ExerciseWorkspace(
      exerciseId: '6-2',
      title: '底部入场',
      filePath: 'lib/exercises/chapter_06/exercise_6_2.dart',
      tasks: const ['卡片从底部淡入。', '透明度与位置共用同一个 Controller。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Card(
            child: Padding(padding: EdgeInsets.all(28), child: Text('待添加入场效果')),
          ),
          FilledButton(
            onPressed: () => _controller.forward(from: 0),
            child: const Text('播放'),
          ),
        ],
      ),
    );
  }
}
