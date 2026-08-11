import 'dart:io';

import 'package:flutter_animation_lab/data/chapter_catalog.dart';
import 'package:flutter_animation_lab/exercises/exercise_registry.dart';
import 'package:flutter_animation_lab/models/learning_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final allExercises = chapters.expand((chapter) => chapter.exercises).toList();

  test('catalog contains nine ordered chapters and coding exercises', () {
    expect(chapters, hasLength(9));
    expect(chapters.map((chapter) => chapter.id), orderedEquals([1, 2, 3, 4, 5, 6, 7, 8, 9]));
    expect(allExercises, hasLength(33));
  });

  test('every chapter has unique difficulties and valid exercise ids', () {
    for (final chapter in chapters) {
      expect(chapter.exercises, isNotEmpty);
      final difficulties = chapter.exercises.map((e) => e.difficulty).toList();
      expect(difficulties.toSet(), hasLength(difficulties.length));
      expect(
        chapter.exercises.every(
          (exercise) =>
              exercise.id.startsWith('${chapter.id}-') && exercise.acceptanceCriteria.isNotEmpty,
        ),
        isTrue,
      );
    }
  });

  test('chapter demo kinds are unique', () {
    expect(chapters.map((chapter) => chapter.demoKind).toSet(), DemoKind.values.toSet());
  });

  test('every exercise has a unique editable source file and preview', () {
    final paths = allExercises.map((exercise) => exercise.sourcePath).toSet();

    expect(paths, hasLength(allExercises.length));
    for (final exercise in allExercises) {
      expect(
        File(exercise.sourcePath).existsSync(),
        isTrue,
        reason: '${exercise.id}: ${exercise.sourcePath}',
      );
      expect(ExerciseRegistry.pageFor(exercise.id), isNotNull);
    }
  });
}
