import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise64Page extends StatelessWidget {
  const Exercise64Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '6-4',
      title: '可复用入场组件',
      filePath: 'lib/exercises/chapter_06/exercise_6_4.dart',
      tasks: [
        '完成 EntranceTransition 的 Controller 和组合动画。',
        '公开方向、曲线、时长参数。',
        '支持 MediaQuery.disableAnimations。',
      ],
      child: EntranceTransition(
        beginOffset: Offset(0, .4),
        child: Text('我通过可复用组件入场'),
      ),
    );
  }
}

// TODO(学员): 把组件改为 StatefulWidget，创建并释放 Controller。
// TODO(学员): 用 beginOffset、curve、duration 驱动淡入与位移。
class EntranceTransition extends StatelessWidget {
  const EntranceTransition({
    super.key,
    required this.child,
    this.beginOffset = const Offset(0, .25),
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final Offset beginOffset;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Center(child: child);
  }
}
