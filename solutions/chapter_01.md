# 第 1 章参考答案

## 1-1 辨认三种角色

`AnimationController` 产生随时间变化的进度并决定总时长；`Curve` 把线性进度转换成有节奏的进度；`Tween<T>` 再把进度映射成业务值。渲染层只消费最终的 `Animation<T>`。

## 1-2 映射温度值

```dart
final fontSize = Tween<double>(begin: 16, end: 32).animate(controller);
```

Controller 为 `0.5` 时，线性情况下字体大小为 `24`。

## 1-3 选择合适方案

- 按钮变色：`AnimatedContainer`，只需从旧目标值过渡到新目标值。
- 无限旋转：`AnimationController.repeat()` + `RotationTransition`，需要控制循环。
- 页面共享图片：两个同 tag 的 `Hero`，由 Navigator 管理飞行动画。

## 1-4 制作曲线比较器

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
