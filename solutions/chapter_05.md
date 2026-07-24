# 第 5 章参考答案

## 5-1 Ticker 与释放

`vsync` 让 Ticker 在页面不活动时静默，避免无意义地产生帧。Controller 持有 Ticker 和监听器；忘记 `dispose` 会产生资源泄漏，并可能触发“Ticker was active”断言。

## 5-2 旋转控制器

```dart
final controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 1),
);

RotationTransition(turns: controller, child: const Icon(Icons.refresh));
// controller.repeat(); controller.stop(); controller.reset();
```

记得在 State 的 `dispose` 中释放 Controller。

## 5-3 往返呼吸灯

透明度使用 `Tween(begin: .45, end: 1)`，缩放使用 `Tween(begin: .9, end: 1.08)`，两者都 animate 同一个 Controller。启动时调用 `repeat(reverse: true)`；`stop()` 不重置进度，之后 `repeat` 会从当前值继续。

## 5-4 手势联动抽屉

`onHorizontalDragUpdate` 中把 `delta.dx / drawerWidth` 加到 `controller.value` 并 `clamp(0, 1)`。`onHorizontalDragEnd` 先看水平速度，速度不明显时以 `value >= .5` 为阈值，再调用 `forward` 或 `reverse`。
