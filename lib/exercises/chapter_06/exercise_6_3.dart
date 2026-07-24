import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise63Page extends StatefulWidget {
  const Exercise63Page({super.key});

  @override
  State<Exercise63Page> createState() => _Exercise63PageState();
}

class _Exercise63PageState extends State<Exercise63Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
      exerciseId: '6-3',
      title: '复合图标动画',
      filePath: 'lib/exercises/chapter_06/exercise_6_3.dart',
      tasks: const [
        '在一个 AnimatedBuilder 中改变旋转角、缩放和阴影。',
        '静态 Icon 必须通过 child 参数复用。',
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            child: const Icon(Icons.auto_awesome, size: 64),
            builder: (_, child) {
              // TODO(学员): 再添加 Transform.scale 和动态 BoxShadow。
              return Transform.rotate(
                angle: _controller.value * math.pi * 2,
                child: child,
              );
            },
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
