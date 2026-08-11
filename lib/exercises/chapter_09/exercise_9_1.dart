import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise91Page extends StatefulWidget {
  const Exercise91Page({super.key});

  @override
  State<Exercise91Page> createState() => _Exercise91PageState();
}

class _Exercise91PageState extends State<Exercise91Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '9-1',
      title: '定位重建成本',
      filePath: 'lib/exercises/chapter_09/exercise_9_1.dart',
      tasks: const ['把静态图标移到 AnimatedBuilder.child。'],
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, _) {
          // TODO(学员): 当前 Icon 每帧都会重新创建；改用 child 参数。
          return Transform.rotate(
            angle: _controller.value * 6.28,
            child: const Icon(Icons.settings, size: 72),
          );
        },
      ),
    );
  }
}
