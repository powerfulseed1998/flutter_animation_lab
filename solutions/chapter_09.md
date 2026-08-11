# 第 9 章参考答案

## 9-1 定位重建成本

`AnimatedBuilder.child` 保存不依赖动画值的 Widget 子树，使 builder 每帧只重建变换层。它不自动阻止像素重绘；重绘范围需要用 DevTools 检查，必要时才使用 `RepaintBoundary`。

## 9-2 支持减少动态效果

```dart
final reduceMotion = MediaQuery.disableAnimationsOf(context);
final duration = reduceMotion ? Duration.zero : const Duration(milliseconds: 300);
```

立即切换仍要保持颜色、图标、语义文本等状态线索，不能让用户失去反馈。

## 9-3 确定性动画测试

```dart
await tester.tap(find.text('展开'));
await tester.pump();
expect(width(), closeTo(100, .1));

await tester.pump(const Duration(milliseconds: 200));
expect(width(), inInclusiveRange(100, 240));

await tester.pump(const Duration(milliseconds: 200));
expect(width(), closeTo(240, .1));
```

测试应使用线性曲线，或只断言中点位于起终点之间。

## 9-4 动画代码审查

把图标移入 `TweenAnimationBuilder.child`，并在 `disableAnimations` 时将 `duration` 设为 `Duration.zero`：

```dart
final reduceMotion = MediaQuery.disableAnimationsOf(context);

return TweenAnimationBuilder<double>(
  tween: Tween(begin: 0, end: 1),
  duration: reduceMotion ? Duration.zero : const Duration(seconds: 1),
  builder: (_, value, child) => Opacity(
    opacity: value,
    child: Transform.scale(scale: .8 + value * .2, child: child),
  ),
  child: const Icon(Icons.rate_review, size: 80),
);
```
