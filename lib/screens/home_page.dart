import 'package:flutter/material.dart';

import '../data/chapter_catalog.dart';
import '../models/learning_models.dart';
import 'chapter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: true,
            title: const Text('Flutter 动画实验室'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Chip(
                  avatar: const Icon(Icons.school_outlined, size: 18),
                  label: Text(
                    '${chapters.length} 章 · ${chapters.expand((c) => c.exercises).length} 题',
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: _IntroCard(chapterCount: chapters.length),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.crossAxisExtent;
                final columns = width >= 1000
                    ? 3
                    : width >= 650
                    ? 2
                    : 1;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: columns == 1 ? 1.65 : 1.5,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _ChapterCard(
                      chapter: chapters[index],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ChapterPage(chapter: chapters[index]),
                        ),
                      ),
                    ),
                    childCount: chapters.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroCard extends StatelessWidget {
  const _IntroCard({required this.chapterCount});

  final int chapterCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [colors.primaryContainer, colors.tertiaryContainer]),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Icon(Icons.animation, size: 52, color: colors.onPrimaryContainer),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '从状态变化，到可控的动画系统',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text('按顺序完成 $chapterCount 个章节：先理解概念，再操作 Demo，最后挑战练习。'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChapterCard extends StatelessWidget {
  const _ChapterCard({required this.chapter, required this.onTap});

  final Chapter chapter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      key: ValueKey('chapter-card-${chapter.id}'),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colors.secondaryContainer,
                    foregroundColor: colors.onSecondaryContainer,
                    child: Text('${chapter.id}'),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward),
                ],
              ),
              const Spacer(),
              Text(
                chapter.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                chapter.subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 12),
              Text(
                '${chapter.exercises.length} 道练习',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: colors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
