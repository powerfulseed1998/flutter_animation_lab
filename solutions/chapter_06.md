# 第 6 章参考答案

## 6-1 Offset 的单位

`SlideTransition` 使用相对于 child 尺寸的偏移：`Offset(0, 1)` 是向下移动一个 child 高度。若需要像素位移，可在 `AnimatedBuilder` 中使用 `Transform.translate`。

## 6-2 底部入场

```dart
final curved = CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);
final position = Tween(
  begin: const Offset(0, .5),
  end: Offset.zero,
).animate(curved);

FadeTransition(
  opacity: curved,
  child: SlideTransition(position: position, child: card),
)
```

## 6-3 复合图标动画

把图标作为 `AnimatedBuilder.child`；builder 根据 `controller.value` 创建 `Transform.rotate`、`Transform.scale` 和动态 `BoxShadow`。这样图标本身不会每帧重建。

## 6-4 可复用入场组件

组件公开 `child`、`beginOffset`、`duration`、`curve` 和 `autoPlay`。State 创建并释放 Controller。检测 `MediaQuery.disableAnimationsOf(context)`；开启时直接显示终态，或只保留短淡入。
