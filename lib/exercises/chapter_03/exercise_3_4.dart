import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise34Page extends StatelessWidget {
  const Exercise34Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '3-4',
      title: '通知队列',
      filePath: 'lib/exercises/chapter_03/exercise_3_4.dart',
      tasks: [
        '实现能快速连续切换消息的 AnimatedSwitcher。',
        '每条消息使用唯一业务 Key。',
        '自定义 layoutBuilder，避免离场消息破坏布局。',
      ],
      child: _NotificationQueue(),
    );
  }
}

class _NotificationQueue extends StatelessWidget {
  const _NotificationQueue();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 改为 StatefulWidget，准备至少三条带 id 的消息，
    // 再实现切换按钮、transitionBuilder 和 layoutBuilder。
    return const StarterPlaceholder(message: 'TODO：实现可连续切换的通知队列');
  }
}
