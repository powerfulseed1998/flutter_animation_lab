import 'package:flutter/material.dart';

class ExerciseWorkspace extends StatelessWidget {
  const ExerciseWorkspace({
    super.key,
    required this.exerciseId,
    required this.title,
    required this.filePath,
    required this.tasks,
    required this.child,
  });

  final String exerciseId;
  final String title;
  final String filePath;
  final List<String> tasks;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('$exerciseId · $title')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.code),
                    SizedBox(width: 8),
                    Text(
                      '在这个文件中完成',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SelectableText(
                  filePath,
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
                const SizedBox(height: 14),
                for (final task in tasks)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('• $task'),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '运行预览',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text('修改下方对应 Widget 后保存，使用热重载查看结果。'),
          const SizedBox(height: 14),
          Card(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 220),
              child: Padding(padding: const EdgeInsets.all(20), child: child),
            ),
          ),
        ],
      ),
    );
  }
}

class StarterPlaceholder extends StatelessWidget {
  const StarterPlaceholder({
    super.key,
    required this.message,
    this.icon = Icons.construction,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 52, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
