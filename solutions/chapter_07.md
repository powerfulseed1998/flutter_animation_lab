# 第 7 章参考答案

## 7-1 默认还是自定义

普通页面应保留 `MaterialPageRoute`，它符合平台导航习惯并处理返回手势。品牌引导、全屏媒体或明确设计规范可使用自定义 Route，但仍应保持返回行为和减少动态效果支持。

## 7-2 淡入页面

```dart
PageRouteBuilder<void>(
  transitionDuration: const Duration(milliseconds: 300),
  reverseTransitionDuration: const Duration(milliseconds: 200),
  pageBuilder: (_, _, _) => const DetailPage(),
  transitionsBuilder: (_, animation, __, child) {
    return FadeTransition(opacity: animation, child: child);
  },
)
```

## 7-3 商品图片 Hero

列表和详情页都使用 `Hero(tag: 'product-${product.id}', child: image)`。同一 Route 中每个商品 ID 必须唯一，目标 Hero 必须首帧存在。

## 7-4 卡片展开转场

在 `flightShuttleBuilder` 中根据飞行方向选择源或目标 child，并使用 `AnimatedBuilder` 插值圆角。页面主体单独淡入。测试 push 后立即 pop、手势取消返回以及图片未加载完成的情况。
