import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise33Page extends StatefulWidget {
  const Exercise33Page({super.key});

  @override
  State<Exercise33Page> createState() => _Exercise33PageState();
}

class _Exercise33PageState extends State<Exercise33Page> {
  int _count = 0;
  bool _increasing = true;

  void _change(int delta) {
    setState(() {
      _increasing = delta > 0;
      _count += delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 为 AnimatedSwitcher 添加 transitionBuilder。
    // _increasing 为 true 时从下方进入，否则从上方进入。
    return ExerciseWorkspace(
      exerciseId: '3-3',
      title: '方向感知计数器',
      filePath: 'lib/exercises/chapter_03/exercise_3_3.dart',
      tasks: const ['数字增加时从下方进入，减少时从上方进入。', '进入过程同时淡入。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              '$_count',
              key: ValueKey(_count),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Text(_increasing ? '当前方向：增加' : '当前方向：减少'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _change(-1),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => _change(1),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
