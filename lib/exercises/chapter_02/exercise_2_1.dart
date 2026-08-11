import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise21Page extends StatelessWidget {
  const Exercise21Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '2-1',
      title: '隐式动画判断',
      filePath: 'lib/exercises/chapter_02/exercise_2_1.dart',
      tasks: [
        '实现一个可点击的选中态卡片。',
        '只使用隐式动画，不创建 AnimationController。',
      ],
      child: _SelectableCard(),
    );
  }
}

/// 选中态只有「未选中 / 已选中」两个目标状态，不需要暂停、循环或手势同步。
/// AnimatedContainer 会自行管理内部 Controller，省去创建、监听与释放的样板代码，
/// 因此这里用隐式动画即可，不必手写 AnimationController。
class _SelectableCard extends StatefulWidget {
  const _SelectableCard();

  @override
  State<_SelectableCard> createState() => _SelectableCardState();
}

class _SelectableCardState extends State<_SelectableCard> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _selected = !_selected),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          width: _selected ? 220 : 160,
          height: _selected ? 120 : 88,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _selected ? colors.primaryContainer : colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(_selected ? 24 : 12),
            border: Border.all(
              color: _selected ? colors.primary : colors.outlineVariant,
              width: _selected ? 3 : 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            _selected ? '已选中' : '点击选中',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _selected ? colors.onPrimaryContainer : colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
