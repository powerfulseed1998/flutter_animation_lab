# 第 3 章参考答案

## 3-1 Key 为什么重要

Flutter 用 `runtimeType + key` 判断 Widget 身份。两个无 Key 的 `Text` 会被视为同一组件的配置更新；`ValueKey(count)` 让新旧数字成为不同 child，AnimatedSwitcher 才会保留旧 child 做离场动画。

## 3-2 加载按钮

```dart
AnimatedSwitcher(
  duration: const Duration(milliseconds: 250),
  child: loading
      ? const SizedBox(
          key: ValueKey('loading'),
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        )
      : const Text('提交', key: ValueKey('label')),
)
```

外层按钮设置固定最小尺寸，避免切换时跳动。

## 3-3 方向感知计数器

更新数字前记录增减方向，在 `transitionBuilder` 中据此选择 `Offset(0, .5)` 或 `Offset(0, -.5)`。数字仍使用 `ValueKey(count)`，并用 `FadeTransition` 软化切换。

## 3-4 通知队列

每条消息使用业务 ID 作为 Key。`layoutBuilder` 可使用 `Stack(alignment: Alignment.center, children: previousChildren + [currentChild])`；限制消息区域高度，并让离场 child 使用 `Positioned.fill`。即使快速切换，每个正在离场的消息仍有独立身份。
