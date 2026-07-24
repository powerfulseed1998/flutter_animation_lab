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

- 生命周期：Controller 在 `initState` 创建、`dispose` 释放，异步回调检查 `mounted`。
- 性能：静态子树使用 child，避免整页监听每帧，先用 DevTools 定位瓶颈。
- 语义：支持 `disableAnimations`，状态变化有 Semantics 或可见文本。
- 测试：用 `pump(Duration)` 验证边界、反向、快速操作和页面销毁，不使用真实延迟。
