import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise13Page extends StatelessWidget {
  const Exercise13Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '1-3',
      title: '选择合适方案',
      filePath: 'lib/exercises/chapter_01/exercise_1_3.dart',
      tasks: [
        '为按钮变色、无限旋转、跨页面图片分别选择 Flutter API。',
        '把你的选择和是否需要 Controller 写进界面。',
      ],
      child: _DecisionTable(),
    );
  }
}

class _DecisionTable extends StatelessWidget {
  const _DecisionTable();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('需求')),
          DataColumn(label: Text('API')),
          DataColumn(label: Text('需要 Controller')),
        ],
        rows: const [
          DataRow(
            cells: [
              DataCell(Text('按钮变色')),
              DataCell(Text('AnimatedContainer')),
              DataCell(Text('否')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('无限旋转')),
              DataCell(Text('AnimationController.repeat + RotationTransition')),
              DataCell(Text('是')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('跨页面图片')),
              DataCell(Text('Hero')),
              DataCell(Text('否（Navigator 管理）')),
            ],
          ),
        ],
      ),
    );
  }
}
