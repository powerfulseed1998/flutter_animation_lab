import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise12Page extends StatefulWidget {
  const Exercise12Page({super.key});

  @override
  State<Exercise12Page> createState() => _Exercise12PageState();
}

class _Exercise12PageState extends State<Exercise12Page> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 使用 Tween<double>(begin: 16, end: 32)
    // 的 transform 方法计算 fontSize，替换下面的固定值。
    final fontSize = Tween<double>(begin: 16, end: 32).transform(_progress);
    return ExerciseWorkspace(
      exerciseId: '1-2',
      title: '映射温度值',
      filePath: 'lib/exercises/chapter_01/exercise_1_2.dart',
      tasks: const ['把 0～1 的进度映射成 16～32 的字体大小。', '拖动 Slider 时文字大小应连续变化。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('24°C', style: TextStyle(fontSize: fontSize)),
          Slider(
            value: _progress,
            onChanged: (value) => setState(() => _progress = value),
          ),
          Text('进度：${_progress.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
