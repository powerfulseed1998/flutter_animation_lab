# 第 2 章参考答案

## 2-1 隐式动画判断

选中态只有“未选中”和“已选中”两个目标状态，不需要暂停、循环或手势同步。隐式动画会管理内部 Controller，也免去了创建、监听和释放的样板代码。

## 2-2 收藏按钮反馈

```dart
AnimatedRotation(
  turns: selected ? .08 : 0,
  duration: const Duration(milliseconds: 280),
  child: AnimatedScale(
    scale: selected ? 1.25 : 1,
    duration: const Duration(milliseconds: 280),
    curve: Curves.easeOutBack,
    child: const Icon(Icons.favorite),
  ),
)
```

## 2-3 安全淡出

```dart
IgnorePointer(
  ignoring: !visible,
  child: AnimatedOpacity(
    opacity: visible ? 1 : 0,
    duration: const Duration(milliseconds: 250),
    child: actionButton,
  ),
)
```

`IgnorePointer` 禁止命中测试，`AnimatedOpacity` 仍保留布局空间。

## 2-4 可展开资料卡

用一个 `expanded` 状态同时控制容器高度、对齐方式和文字样式。所有组件使用相同 `duration`，圆角可使用较柔和的 `easeOutCubic`，图标可单独使用 `easeOutBack`。内容较长时放进 `ClipRect` 或保证展开高度足够，避免中间帧溢出。
