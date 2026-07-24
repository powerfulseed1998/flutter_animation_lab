import 'dart:io';

import 'package:flutter_animation_lab/data/chapter_catalog.dart';
import 'package:flutter_animation_lab/exercises/exercise_registry.dart';
import 'package:flutter_animation_lab/models/learning_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('catalog contains nine ordered chapters and 36 exercises', () {
    expect(chapters, hasLength(9));
    expect(
      chapters.map((chapter) => chapter.id),
      orderedEquals([1, 2, 3, 4, 5, 6, 7, 8, 9]),
    );
    expect(chapters.expand((chapter) => chapter.exercises), hasLength(36));
  });

  test('every chapter has one exercise at each difficulty', () {
    for (final chapter in chapters) {
      expect(chapter.exercises, hasLength(4));
      expect(
        chapter.exercises.map((exercise) => exercise.difficulty).toSet(),
        ExerciseDifficulty.values.toSet(),
        reason: 'chapter ${chapter.id}',
      );
      expect(
        chapter.exercises.every(
          (exercise) =>
              exercise.id.startsWith('${chapter.id}-') &&
              exercise.acceptanceCriteria.isNotEmpty,
        ),
        isTrue,
      );
    }
  });

  test('chapter demo kinds are unique', () {
    expect(
      chapters.map((chapter) => chapter.demoKind).toSet(),
      DemoKind.values.toSet(),
    );
  });

  test('every exercise has a unique editable source file and preview', () {
    final exercises = chapters.expand((chapter) => chapter.exercises).toList();
    final paths = exercises.map((exercise) => exercise.sourcePath).toSet();

    expect(paths, hasLength(36));
    for (final exercise in exercises) {
      expect(
        File(exercise.sourcePath).existsSync(),
        isTrue,
        reason: '${exercise.id}: ${exercise.sourcePath}',
      );
      expect(ExerciseRegistry.pageFor(exercise.id), isNotNull);
    }
  });
}
