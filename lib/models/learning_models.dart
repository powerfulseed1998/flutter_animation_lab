enum ExerciseDifficulty {
  concept('概念'),
  basic('基础'),
  application('应用'),
  challenge('挑战');

  const ExerciseDifficulty(this.label);

  final String label;
}

enum DemoKind {
  core,
  implicit,
  switcher,
  tweenBuilder,
  controller,
  transitions,
  navigation,
  staggeredList,
  engineering,
}

class Exercise {
  const Exercise({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.prompt,
    required this.acceptanceCriteria,
  });

  final String id;
  final String title;
  final ExerciseDifficulty difficulty;
  final String prompt;
  final List<String> acceptanceCriteria;

  String get sourcePath {
    if (id == '9-3') {
      return 'test/exercises/chapter_09/exercise_9_3_test.dart';
    }
    final parts = id.split('-');
    final chapter = parts.first.padLeft(2, '0');
    return 'lib/exercises/chapter_$chapter/exercise_${parts.join('_')}.dart';
  }
}

class Chapter {
  const Chapter({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.demoKind,
    required this.concepts,
    required this.codeSnippet,
    required this.exercises,
  });

  final int id;
  final String title;
  final String subtitle;
  final DemoKind demoKind;
  final List<String> concepts;
  final String codeSnippet;
  final List<Exercise> exercises;
}
