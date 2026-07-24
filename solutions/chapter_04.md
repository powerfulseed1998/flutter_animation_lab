# 第 4 章参考答案

## 4-1 何时使用 Builder

只关心“动画到新目标值”时使用 `TweenAnimationBuilder`；需要暂停、反向、循环、进度监听或手势联动时使用 `AnimationController`。前者管理内部 Controller，无需手动释放。

## 4-2 分数递增

```dart
TweenAnimationBuilder<double>(
  tween: Tween(end: score.toDouble()),
  duration: const Duration(milliseconds: 600),
  builder: (_, value, __) => Text(value.round().toString()),
)
```

目标再次变化时，会从当前插值值继续，而不是从零开始。

## 4-3 环形进度

```dart
TweenAnimationBuilder<double>(
  tween: Tween(end: target),
  duration: const Duration(milliseconds: 500),
  builder: (_, value, __) => Stack(
    alignment: Alignment.center,
    children: [
      CircularProgressIndicator(value: value),
      Text('${(value * 100).round()}%'),
    ],
  ),
)
```

## 4-4 颜色与圆角插值

可用一个 `Tween<double>` 作为统一进度，在 builder 中调用 `Color.lerp`、`lerpDouble` 和数值插值。复杂且不变化的图标、图片通过 `child` 传入。不要在构建后修改 TweenAnimationBuilder 已接管的 Tween 实例。
