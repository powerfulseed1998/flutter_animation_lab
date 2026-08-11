# 第 1 章参考答案

## 1-1 映射温度值

```dart
final fontSize = Tween<double>(begin: 16, end: 32).animate(controller);
```

Controller 为 `0.5` 时，线性情况下字体大小为 `24`。

## 1-2 制作曲线比较器

创建一个 Controller，再为每个轨道建立不同的 `CurvedAnimation`：

```dart
Animation<Offset> track(Curve curve) => Tween(
  begin: Offset.zero,
  end: const Offset(1, 0),
).animate(CurvedAnimation(parent: controller, curve: curve));

final linear = track(Curves.linear);
final cubic = track(Curves.easeOutCubic);
final back = track(Curves.easeOutBack);
```

三个 `SlideTransition` 共用 Controller，重播调用 `controller.forward(from: 0)`。
