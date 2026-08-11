import 'package:flutter/widgets.dart';

import 'chapter_01/exercise_1_1.dart';
import 'chapter_01/exercise_1_2.dart';
import 'chapter_02/exercise_2_1.dart';
import 'chapter_02/exercise_2_2.dart';
import 'chapter_02/exercise_2_3.dart';
import 'chapter_02/exercise_2_4.dart';
import 'chapter_03/exercise_3_1.dart';
import 'chapter_03/exercise_3_2.dart';
import 'chapter_03/exercise_3_3.dart';
import 'chapter_03/exercise_3_4.dart';
import 'chapter_04/exercise_4_1.dart';
import 'chapter_04/exercise_4_2.dart';
import 'chapter_04/exercise_4_3.dart';
import 'chapter_04/exercise_4_4.dart';
import 'chapter_05/exercise_5_1.dart';
import 'chapter_05/exercise_5_2.dart';
import 'chapter_05/exercise_5_3.dart';
import 'chapter_05/exercise_5_4.dart';
import 'chapter_06/exercise_6_1.dart';
import 'chapter_06/exercise_6_2.dart';
import 'chapter_06/exercise_6_3.dart';
import 'chapter_06/exercise_6_4.dart';
import 'chapter_07/exercise_7_1.dart';
import 'chapter_07/exercise_7_2.dart';
import 'chapter_07/exercise_7_3.dart';
import 'chapter_07/exercise_7_4.dart';
import 'chapter_08/exercise_8_1.dart';
import 'chapter_08/exercise_8_2.dart';
import 'chapter_08/exercise_8_3.dart';
import 'chapter_09/exercise_9_1.dart';
import 'chapter_09/exercise_9_2.dart';
import 'chapter_09/exercise_9_3.dart';
import 'chapter_09/exercise_9_4.dart';

abstract final class ExerciseRegistry {
  static Widget pageFor(String id) {
    return switch (id) {
      '1-1' => const Exercise11Page(),
      '1-2' => const Exercise12Page(),
      '2-1' => const Exercise21Page(),
      '2-2' => const Exercise22Page(),
      '2-3' => const Exercise23Page(),
      '2-4' => const Exercise24Page(),
      '3-1' => const Exercise31Page(),
      '3-2' => const Exercise32Page(),
      '3-3' => const Exercise33Page(),
      '3-4' => const Exercise34Page(),
      '4-1' => const Exercise41Page(),
      '4-2' => const Exercise42Page(),
      '4-3' => const Exercise43Page(),
      '4-4' => const Exercise44Page(),
      '5-1' => const Exercise51Page(),
      '5-2' => const Exercise52Page(),
      '5-3' => const Exercise53Page(),
      '5-4' => const Exercise54Page(),
      '6-1' => const Exercise61Page(),
      '6-2' => const Exercise62Page(),
      '6-3' => const Exercise63Page(),
      '6-4' => const Exercise64Page(),
      '7-1' => const Exercise71Page(),
      '7-2' => const Exercise72Page(),
      '7-3' => const Exercise73Page(),
      '7-4' => const Exercise74Page(),
      '8-1' => const Exercise81Page(),
      '8-2' => const Exercise82Page(),
      '8-3' => const Exercise83Page(),
      '9-1' => const Exercise91Page(),
      '9-2' => const Exercise92Page(),
      '9-3' => const Exercise93Page(),
      '9-4' => const Exercise94Page(),
      _ => throw ArgumentError.value(id, 'id', '未知练习编号'),
    };
  }
}
