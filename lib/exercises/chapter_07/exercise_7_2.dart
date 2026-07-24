import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise72Page extends StatelessWidget {
  const Exercise72Page({super.key});

  Route<void> _buildRoute() {
    // TODO(学员): 改成 PageRouteBuilder。
    // 正向 300ms，反向 200ms，transitionsBuilder 使用 FadeTransition。
    return MaterialPageRoute<void>(builder: (_) => const _FadeTargetPage());
  }

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '7-2',
      title: '淡入页面',
      filePath: 'lib/exercises/chapter_07/exercise_7_2.dart',
      tasks: const [
        '用 PageRouteBuilder 实现 300ms 淡入和 200ms 退出。',
        'transitionsBuilder 必须复用传入的 child。',
      ],
      child: Center(
        child: FilledButton(
          onPressed: () => Navigator.of(context).push(_buildRoute()),
          child: const Text('打开目标页'),
        ),
      ),
    );
  }
}

class _FadeTargetPage extends StatelessWidget {
  const _FadeTargetPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('淡入目标页')),
      body: const Center(child: Icon(Icons.wb_sunny, size: 96)),
    );
  }
}
