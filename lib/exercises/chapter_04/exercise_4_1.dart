import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise41Page extends StatelessWidget {
  const Exercise41Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '4-1',
      title: '何时使用 Builder',
      filePath: 'lib/exercises/chapter_04/exercise_4_1.dart',
      tasks: ['实现两个小 Demo：目标值动画与可暂停动画。', '前者使用 TweenAnimationBuilder，后者使用 AnimationController。'],
      child: _Comparison(),
    );
  }
}

class _Comparison extends StatelessWidget {
  const _Comparison();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _TargetValueDemo(),
        SizedBox(height: 24),
        Divider(),
        SizedBox(height: 24),
        _PausableDemo(),
      ],
    );
  }
}

/// 只关心「动画到新目标值」：内部 Controller 由 TweenAnimationBuilder 管理。
class _TargetValueDemo extends StatefulWidget {
  const _TargetValueDemo();

  @override
  State<_TargetValueDemo> createState() => _TargetValueDemoState();
}

class _TargetValueDemoState extends State<_TargetValueDemo> {
  double _target = 0.25;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('目标值动画', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text('只需声明新的 Tween.end，无需暂停或循环。', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 16),
        TweenAnimationBuilder<double>(
          tween: Tween(end: _target),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Column(
              children: [
                LinearProgressIndicator(value: value),
                const SizedBox(height: 8),
                Text('${(value * 100).round()}%'),
              ],
            );
          },
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: [
            for (final target in [0.25, 0.5, 0.75, 1.0])
              ChoiceChip(
                label: Text('${(target * 100).round()}%'),
                selected: _target == target,
                onSelected: (_) => setState(() => _target = target),
              ),
          ],
        ),
      ],
    );
  }
}

/// 需要暂停 / 继续时，必须持有并释放 AnimationController。
class _PausableDemo extends StatefulWidget {
  const _PausableDemo();

  @override
  State<_PausableDemo> createState() => _PausableDemoState();
}

class _PausableDemoState extends State<_PausableDemo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('可暂停动画', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text('播放、暂停、重置都走同一个 Controller。', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 16),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              children: [
                LinearProgressIndicator(value: _controller.value),
                const SizedBox(height: 8),
                Text('${(_controller.value * 100).round()}%'),
              ],
            );
          },
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilledButton(onPressed: _controller.forward, child: const Text('播放')),
            OutlinedButton(onPressed: _controller.stop, child: const Text('暂停')),
            TextButton(onPressed: _controller.reset, child: const Text('重置')),
          ],
        ),
      ],
    );
  }
}
