import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise24Page extends StatelessWidget {
  const Exercise24Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '2-4',
      title: '可展开资料卡',
      filePath: 'lib/exercises/chapter_02/exercise_2_4.dart',
      tasks: [
        '组合 AnimatedContainer、AnimatedAlign 和 AnimatedDefaultTextStyle。',
        '折叠和展开都不能出现布局溢出。',
      ],
      child: _ExpandableProfileCard(),
    );
  }
}

class _ExpandableProfileCard extends StatefulWidget {
  const _ExpandableProfileCard();

  @override
  State<_ExpandableProfileCard> createState() => _ExpandableProfileCardState();
}

class _ExpandableProfileCardState extends State<_ExpandableProfileCard> {
  bool _expanded = false;

  static const _duration = Duration(milliseconds: 350);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _expanded = !_expanded),
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: colors.primaryContainer,
          child: AnimatedContainer(
            duration: _duration,
            curve: Curves.easeOutCubic,
            width: _expanded ? 320 : 240,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AnimatedScale(
                      scale: _expanded ? 1 : 0.85,
                      duration: _duration,
                      curve: Curves.easeOutBack,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: colors.primary,
                        child: Icon(Icons.person, color: colors.onPrimary),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AnimatedDefaultTextStyle(
                        duration: _duration,
                        curve: Curves.easeOutCubic,
                        style: TextStyle(
                          color: colors.onPrimaryContainer,
                          fontSize: _expanded ? 18 : 15,
                          fontWeight: _expanded ? FontWeight.w600 : FontWeight.w500,
                          height: 1.3,
                        ),
                        child: const Text(
                          'Ada Lovelace',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRect(
                  child: AnimatedAlign(
                    duration: _duration,
                    curve: Curves.easeOutCubic,
                    alignment: Alignment.topLeft,
                    heightFactor: _expanded ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: AnimatedDefaultTextStyle(
                        duration: _duration,
                        curve: Curves.easeOutCubic,
                        style: TextStyle(
                          color: colors.onPrimaryContainer,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                        child: const Text('数学家与早期程序员。点击卡片切换折叠 / 展开。'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
