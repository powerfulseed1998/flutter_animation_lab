import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise11Page extends StatelessWidget {
  const Exercise11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '1-1',
      title: '辨认三种角色',
      filePath: 'lib/exercises/chapter_01/exercise_1_1.dart',
      tasks: ['补全 _RoleCard，让页面分别说明 Controller、Curve、Tween 的职责。', '在 Controller 卡片中明确写出“负责总时长”。'],
      child: _RoleCards(),
    );
  }
}

class _RoleCards extends StatelessWidget {
  const _RoleCards();

  @override
  Widget build(BuildContext context) {
    // TODO(学员): 用三个 Card 替换占位内容。
    // 每张卡至少包含角色名称、输入、输出和职责说明。
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Column(
            children: [
              Text('Controller'),
              SizedBox(height: 10),
              Text('Curve'),
              SizedBox(height: 10),
              Text('Tween'),
            ],
          ),
        ],
      ),
    );
  }
}
