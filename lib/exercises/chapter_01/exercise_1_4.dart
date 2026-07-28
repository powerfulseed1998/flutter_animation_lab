import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise14Page extends StatefulWidget {
  const Exercise14Page({super.key});

  @override
  State<Exercise14Page> createState() => _Exercise14PageState();
}

class _Exercise14PageState extends State<Exercise14Page> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Animation<Offset> _track(Curve curve) {
    return Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(2, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: curve));
  }

  Widget _buildTrack(String name, Animation<Offset> position) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          const SizedBox(height: 6),
          SlideTransition(
            position: position,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final linear = _track(Curves.linear);
    final cubic = _track(Curves.easeOutCubic);
    final back = _track(Curves.easeOutBack);

    return ExerciseWorkspace(
      exerciseId: '1-4',
      title: '制作曲线比较器',
      filePath: 'lib/exercises/chapter_01/exercise_1_4.dart',
      tasks: const ['三个动画必须共用 _controller。', '为每条轨道显示曲线名称，并支持重播。'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTrack('linear', linear),
          _buildTrack('easeOutCubic', cubic),
          _buildTrack('easeOutBack', back),
          const SizedBox(height: 8),
          FilledButton(onPressed: () => _controller.forward(from: 0), child: const Text('重播')),
        ],
      ),
    );
  }
}
