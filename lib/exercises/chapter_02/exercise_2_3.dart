import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise23Page extends StatefulWidget {
  const Exercise23Page({super.key});

  @override
  State<Exercise23Page> createState() => _Exercise23PageState();
}

class _Exercise23PageState extends State<Exercise23Page> {
  bool _visible = true;
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '2-3',
      title: '安全淡出',
      filePath: 'lib/exercises/chapter_02/exercise_2_3.dart',
      tasks: const [
        '让操作按钮使用 AnimatedOpacity 淡入淡出。',
        '隐藏后保留空间，但 IgnorePointer 必须阻止点击。',
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO(学员): 用 IgnorePointer + AnimatedOpacity 包住此按钮。
          ElevatedButton(
            onPressed: () => setState(() => _tapCount++),
            child: Text('已点击 $_tapCount 次'),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('显示操作按钮'),
            value: _visible,
            onChanged: (value) => setState(() => _visible = value),
          ),
        ],
      ),
    );
  }
}
