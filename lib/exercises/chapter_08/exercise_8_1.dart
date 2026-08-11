import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise81Page extends StatefulWidget {
  const Exercise81Page({super.key});

  @override
  State<Exercise81Page> createState() => _Exercise81PageState();
}

class _Exercise81PageState extends State<Exercise81Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    // TODO(学员): 在此创建 opacity、position、scale 三个 Animation。
    // 分别使用 Interval(0,.35)、Interval(.2,.7)、Interval(.55,1)。
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '8-1',
      title: '三段入场',
      filePath: 'lib/exercises/chapter_08/exercise_8_1.dart',
      tasks: const ['透明度、位移和缩放依次执行并允许重叠。', '三个动画共用一个 Controller。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO(学员): 用三个 Transition Widget 包住此卡片。
          const Card(
            child: Padding(padding: EdgeInsets.all(32), child: Text('交错入场卡片')),
          ),
          FilledButton(
            onPressed: () => _controller.forward(from: 0),
            child: const Text('重播'),
          ),
        ],
      ),
    );
  }
}
