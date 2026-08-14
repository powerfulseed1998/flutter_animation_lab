import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise32Page extends StatefulWidget {
  const Exercise32Page({super.key});

  @override
  State<Exercise32Page> createState() => _Exercise32PageState();
}

class _Exercise32PageState extends State<Exercise32Page> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '3-2',
      title: '加载按钮',
      filePath: 'lib/exercises/chapter_03/exercise_3_2.dart',
      tasks: const [
        '在文字和进度指示器之间添加 AnimatedSwitcher。',
        '两个 child 使用不同 Key，并保持按钮尺寸稳定。',
      ],
      child: Center(
        child: SizedBox(
          width: 160,
          child: FilledButton(
            onPressed: () => setState(() => _loading = !_loading),
            // TODO(学员): 用 AnimatedSwitcher 替换当前条件表达式。
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: _loading
                  ? const SizedBox.square(
                      dimension: 20,
                      key: ValueKey('square'),
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white,),
                    )
                  : const Text(
                    '提交',
                    key: ValueKey('submit text'),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
