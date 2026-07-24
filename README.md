# Flutter 动画实验室

一个面向日常 Flutter 开发的中文交互式学习项目。每个章节由知识要点、可操作 Demo 和四道分级练习组成。

## 运行

```bash
flutter pub get
flutter run -d macos
```

也可以连接 Android 或 iOS 设备后使用 `flutter run`。

## 学习方式

1. 从首页按章节顺序学习。
2. 在“知识”页理解 API 的职责与适用条件。
3. 在“演示”页改变状态、曲线或播放方向。
4. 在“练习”页点击“打开代码练习”，查看文件路径和运行预览。
5. 打开对应 `lib/exercises/chapter_XX/exercise_X_X.dart`，完成其中的 `TODO(学员)`。
6. 保存后使用热重载检查效果，最后阅读 [`solutions/`](solutions/) 中的参考答案。

每道题都有独立文件，并保持初始状态可编译。部分题从占位骨架开始，部分题提供已有代码，要求修正 Key、补充动画包装、实现 Controller 控制或完成测试。第 9-3 题位于 `test/exercises/chapter_09/exercise_9_3_test.dart`，完成断言后需要删除 `skip: true`。

## 章节

1. 动画核心与方案选择
2. 常用隐式动画
3. AnimatedSwitcher 与 Key
4. TweenAnimationBuilder
5. AnimationController
6. Transitions 与 AnimatedBuilder
7. 页面转场与 Hero
8. 交错动画与动态列表
9. 性能、无障碍与测试

## 验证

```bash
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter build macos --debug
```
