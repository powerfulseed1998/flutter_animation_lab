import 'package:flutter/material.dart';

import '../demos/animation_demos.dart';
import '../exercises/exercise_registry.dart';
import '../models/learning_models.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key, required this.chapter});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('第 ${chapter.id} 章 · ${chapter.title}'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.menu_book_outlined), text: '知识'),
              Tab(icon: Icon(Icons.play_circle_outline), text: '演示'),
              Tab(icon: Icon(Icons.edit_note), text: '练习'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _KnowledgeTab(chapter: chapter),
            _DemoTab(chapter: chapter),
            _ExercisesTab(chapter: chapter),
          ],
        ),
      ),
    );
  }
}

class _KnowledgeTab extends StatelessWidget {
  const _KnowledgeTab({required this.chapter});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(chapter.subtitle, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 24),
        ...chapter.concepts.indexed.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 14,
                  child: Text(
                    '${entry.$1 + 1}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(entry.$2)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text('关键代码', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        _CodeBlock(code: chapter.codeSnippet),
      ],
    );
  }
}

class _DemoTab extends StatelessWidget {
  const _DemoTab({required this.chapter});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          '动手操作',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        const Text('改变参数、重播动画，并观察每个 API 的职责。'),
        const SizedBox(height: 18),
        DemoForKind(kind: chapter.demoKind),
      ],
    );
  }
}

class _ExercisesTab extends StatelessWidget {
  const _ExercisesTab({required this.chapter});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: chapter.exercises.length + 1,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text('每题都有独立代码文件。打开预览后编辑 TODO，热重载查看效果；完成后再核对 solutions。'),
          );
        }
        return _ExerciseCard(exercise: chapter.exercises[index - 1]);
      },
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  const _ExerciseCard({required this.exercise});

  final Exercise exercise;

  Color _difficultyColor(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return switch (exercise.difficulty) {
      ExerciseDifficulty.concept => colors.secondary,
      ExerciseDifficulty.basic => Colors.green.shade700,
      ExerciseDifficulty.application => colors.primary,
      ExerciseDifficulty.challenge => colors.error,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _difficultyColor(context);
    return Card(
      key: ValueKey('exercise-${exercise.id}'),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    exercise.difficulty.label,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${exercise.id}  ${exercise.title}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(exercise.prompt),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SelectableText(
                exercise.sourcePath,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ),
            const SizedBox(height: 12),
            Text('完成标准', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 4),
            ...exercise.acceptanceCriteria.map((item) => Text('• $item')),
            const SizedBox(height: 14),
            FilledButton.tonalIcon(
              key: ValueKey('open-exercise-${exercise.id}'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ExerciseRegistry.pageFor(exercise.id),
                ),
              ),
              icon: const Icon(Icons.code),
              label: const Text('打开代码练习'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SelectableText(
        code.trim(),
        style: const TextStyle(fontFamily: 'monospace', height: 1.45),
      ),
    );
  }
}
