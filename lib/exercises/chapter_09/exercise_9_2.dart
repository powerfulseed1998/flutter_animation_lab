import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise92Page extends StatefulWidget {
  const Exercise92Page({super.key});

  @override
  State<Exercise92Page> createState() => _Exercise92PageState();
}

class _Exercise92PageState extends State<Exercise92Page> {
  bool _moved = false;

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 读取 MediaQuery.disableAnimationsOf(context)。
    // 开启时使用 Duration.zero，关闭时使用 400ms。
    const duration = Duration(milliseconds: 400);
    return ExerciseWorkspace(
      exerciseId: '9-2',
      title: '支持减少动态效果',
      filePath: 'lib/exercises/chapter_09/exercise_9_2.dart',
      tasks: const ['系统要求减少动态效果时立即切换位置。', '颜色和文字仍要清晰表达最终状态。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: AnimatedAlign(
              duration: duration,
              alignment: _moved ? Alignment.centerRight : Alignment.centerLeft,
              child: CircleAvatar(child: Text(_moved ? '终' : '始')),
            ),
          ),
          FilledButton(
            onPressed: () => setState(() => _moved = !_moved),
            child: const Text('切换'),
          ),
        ],
      ),
    );
  }
}
