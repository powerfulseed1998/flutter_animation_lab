import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise71Page extends StatelessWidget {
  const Exercise71Page({super.key});

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '7-1',
      title: '默认还是自定义',
      filePath: 'lib/exercises/chapter_07/exercise_7_1.dart',
      tasks: const [
        '实现两个按钮：一个使用 MaterialPageRoute，一个使用自定义 Route。',
      ],
      child: Wrap(
        spacing: 12,
        alignment: WrapAlignment.center,
        children: [
          FilledButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const _SamplePage(title: '默认转场'),
              ),
            ),
            child: const Text('默认转场'),
          ),
          // TODO(学员): 用 PageRouteBuilder 替换此 MaterialPageRoute。
          OutlinedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const _SamplePage(title: '自定义转场'),
              ),
            ),
            child: const Text('自定义转场'),
          ),
        ],
      ),
    );
  }
}

class _SamplePage extends StatelessWidget {
  const _SamplePage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
