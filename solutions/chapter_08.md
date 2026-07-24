# 第 8 章参考答案

## 8-1 计算实际时间

`1200 × 0.25 = 300ms` 开始，`1200 × 0.75 = 900ms` 结束，因此持续 `600ms`。

## 8-2 三段入场

可令透明度使用 `Interval(0, .35)`，位移使用 `Interval(.2, .7)`，缩放使用 `Interval(.55, 1)`。三个 `CurvedAnimation` 的 parent 都是同一个 Controller。

## 8-3 可增删清单

插入时先更新数据，再调用 `insertItem(index)`。删除时先保存并从集合移除，然后把保存值传给 `removeItem` 的 builder：

```dart
final removed = items.removeAt(index);
listKey.currentState!.removeItem(
  index,
  (_, animation) => SizeTransition(
    sizeFactor: animation,
    child: Text(removed),
  ),
);
```

## 8-4 可重排任务板

所有操作通过单一方法串行更新数据和 AnimatedList；先验证索引，再保存删除项。每项使用数据 ID 作为 Key。空状态放在外层 `AnimatedSwitcher`，不要把它混入列表数据。
