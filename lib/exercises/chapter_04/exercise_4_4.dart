import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise44Page extends StatefulWidget {
  const Exercise44Page({super.key});

  @override
  State<Exercise44Page> createState() => _Exercise44PageState();
}

class _Exercise44PageState extends State<Exercise44Page> {
  bool _hot = false;

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '4-4',
      title: '颜色与圆角插值',
      filePath: 'lib/exercises/chapter_04/exercise_4_4.dart',
      tasks: const ['用统一进度插值颜色、圆角和温度数字。', '把不随动画变化的天气图标放入 child 参数。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO(学员): 用 TweenAnimationBuilder<double> 重写此 Container。
          // builder 中使用 Color.lerp、数值插值和 BorderRadius.circular。
          Container(
            padding: const EdgeInsets.all(28),
            color: _hot ? Colors.orange : Colors.lightBlue,
            child: Text(_hot ? '34°C' : '12°C'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => setState(() => _hot = !_hot),
            child: const Text('切换温度'),
          ),
        ],
      ),
    );
  }
}
