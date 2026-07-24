import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise73Page extends StatelessWidget {
  const Exercise73Page({super.key});

  static const products = [(id: 101, name: '蓝色背包'), (id: 102, name: '旅行相机')];

  @override
  Widget build(BuildContext context) {
    return ExerciseWorkspace(
      exerciseId: '7-3',
      title: '商品图片 Hero',
      filePath: 'lib/exercises/chapter_07/exercise_7_3.dart',
      tasks: const ['列表图片和详情页图片使用相同 Hero tag。', 'tag 必须来自商品 ID，不能写成所有商品共用的常量。'],
      child: Column(
        children: [
          for (final product in products)
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.shopping_bag)),
              title: Text(product.name),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => _ProductDetail(product: product),
                ),
              ),
              // TODO(学员): 用 Hero 包住 leading，tag 使用 product.id。
            ),
        ],
      ),
    );
  }
}

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({required this.product});

  final ({int id, String name}) product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: const Center(
        // TODO(学员): 添加与列表中 tag 相同的 Hero。
        child: Icon(Icons.shopping_bag, size: 160),
      ),
    );
  }
}
