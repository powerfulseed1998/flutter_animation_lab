import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise83Page extends StatefulWidget {
  const Exercise83Page({super.key});

  @override
  State<Exercise83Page> createState() => _Exercise83PageState();
}

class _Exercise83PageState extends State<Exercise83Page> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _items = <String>['任务 A', '任务 B'];

  void _insert() {
    // TODO(学员): 先在 _items 的索引 0 插入数据，再调用 insertItem(0)。
  }

  void _removeLast() {
    // TODO(学员): 保存并删除最后一项，再调用 removeItem。
    // removeItem 的 builder 必须显示保存下来的字符串。
  }

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '8-3',
      title: '可增删清单',
      filePath: 'lib/exercises/chapter_08/exercise_8_3.dart',
      tasks: const ['使用 AnimatedList 实现头部插入和末项删除。', '数据集合与动画索引始终同步。'],
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (_, index, animation) => SizeTransition(
                sizeFactor: animation,
                child: ListTile(title: Text(_items[index])),
              ),
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              FilledButton(onPressed: _insert, child: const Text('头部插入')),
              OutlinedButton(onPressed: _removeLast, child: const Text('删除末项')),
            ],
          ),
        ],
      ),
    );
  }
}
