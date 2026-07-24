import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise54Page extends StatefulWidget {
  const Exercise54Page({super.key});

  @override
  State<Exercise54Page> createState() => _Exercise54PageState();
}

class _Exercise54PageState extends State<Exercise54Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 在 onHorizontalDragUpdate 中按抽屉宽度更新并 clamp value。
    // TODO(学员): 在 onHorizontalDragEnd 中根据速度或 0.5 阈值决定 forward/reverse。
    return ExerciseWorkspace(
      exerciseId: '5-4',
      title: '手势联动抽屉',
      filePath: 'lib/exercises/chapter_05/exercise_5_4.dart',
      tasks: const ['水平拖动实时更新 Controller.value。', '松手后根据速度或进度决定打开与关闭。'],
      child: GestureDetector(
        onHorizontalDragUpdate: (_) {},
        onHorizontalDragEnd: (_) {},
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, _) => Align(
            alignment: Alignment(-1 + _controller.value * 2, 0),
            child: Container(
              width: 120,
              height: 160,
              color: Theme.of(context).colorScheme.primaryContainer,
              alignment: Alignment.center,
              child: const Text('拖动我'),
            ),
          ),
        ),
      ),
    );
  }
}
