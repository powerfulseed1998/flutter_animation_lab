import '../models/learning_models.dart';

const chapters = <Chapter>[
  Chapter(
    id: 1,
    title: '动画核心与方案选择',
    subtitle: '理解 Animation<T>、Tween、Curve，以及何时使用哪种动画',
    demoKind: DemoKind.core,
    concepts: [
      'AnimationController 通常提供 0.0 到 1.0 的时间进度。',
      'Tween 把归一化进度映射为尺寸、颜色、位置等业务值。',
      'Curve 只改变速度节奏，不改变起点、终点和总时长。',
      '只有需要播放控制、循环或手势联动时，才优先考虑显式动画。',
    ],
    codeSnippet: '''
final curved = CurvedAnimation(
  parent: controller,
  curve: Curves.easeOutCubic,
);

final width = Tween<double>(
  begin: 80,
  end: 240,
).animate(curved);''',
    exercises: [
      Exercise(
        id: '1-1',
        title: '映射温度值',
        difficulty: ExerciseDifficulty.basic,
        prompt: '把 0～1 的动画进度映射成 16～32 的字体大小。',
        acceptanceCriteria: ['使用 Tween<double>', '起点和终点正确'],
      ),
      Exercise(
        id: '1-2',
        title: '制作曲线比较器',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '并排展示 linear、easeOutCubic、easeOutBack 三条曲线驱动的相同位移动画。',
        acceptanceCriteria: ['共用一个 Controller', '三种曲线视觉差异清晰', '支持重播'],
      ),
    ],
  ),
  Chapter(
    id: 2,
    title: '常用隐式动画',
    subtitle: '用目标状态驱动尺寸、颜色、透明度和位置变化',
    demoKind: DemoKind.implicit,
    concepts: [
      '隐式动画只需声明目标值、duration 和 curve。',
      'AnimatedOpacity 为 0 时仍占据布局并可能响应点击。',
      'AnimatedPositioned 必须作为 Stack 的直接子组件。',
      '多个属性一起变化时，AnimatedContainer 往往最省代码。',
    ],
    codeSnippet: '''
AnimatedContainer(
  duration: const Duration(milliseconds: 350),
  curve: Curves.easeOutCubic,
  width: expanded ? 220 : 100,
  color: expanded ? Colors.purple : Colors.blue,
  child: const Text('点我'),
)''',
    exercises: [
      Exercise(
        id: '2-1',
        title: '隐式动画判断',
        difficulty: ExerciseDifficulty.concept,
        prompt: '用隐式动画实现可点击的选中态卡片，不创建 AnimationController。',
        acceptanceCriteria: ['点击可切换选中态', '只使用隐式动画 Widget'],
      ),
      Exercise(
        id: '2-2',
        title: '收藏按钮反馈',
        difficulty: ExerciseDifficulty.basic,
        prompt: '使用 AnimatedScale 和 AnimatedRotation 制作收藏按钮的选中反馈。',
        acceptanceCriteria: ['点击可切换状态', '动画时长不超过 400ms'],
      ),
      Exercise(
        id: '2-3',
        title: '安全淡出',
        difficulty: ExerciseDifficulty.application,
        prompt: '让按钮淡出后不再接收点击，同时保留原布局空间。',
        acceptanceCriteria: ['使用 AnimatedOpacity', '结合 IgnorePointer'],
      ),
      Exercise(
        id: '2-4',
        title: '可展开资料卡',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '组合 AnimatedContainer、AnimatedAlign 和 AnimatedDefaultTextStyle 完成资料卡展开效果。',
        acceptanceCriteria: ['至少三个属性参与动画', '折叠与展开均平滑', '不发生布局溢出'],
      ),
    ],
  ),
  Chapter(
    id: 3,
    title: 'AnimatedSwitcher 与 Key',
    subtitle: '在 Widget 替换时创建自然的淡入、滑动和缩放过渡',
    demoKind: DemoKind.switcher,
    concepts: [
      '新旧 child 类型和 Key 都相同时，AnimatedSwitcher 不会把它们视为不同组件。',
      'ValueKey 应表达内容身份，例如计数值或数据 ID。',
      'transitionBuilder 可组合 FadeTransition、SlideTransition 等效果。',
      'layoutBuilder 决定进入和离开的 Widget 如何同时布局。',
    ],
    codeSnippet: '''
AnimatedSwitcher(
  duration: const Duration(milliseconds: 250),
  child: Text(
    '\$count',
    key: ValueKey(count),
  ),
)''',
    exercises: [
      Exercise(
        id: '3-1',
        title: 'Key 为什么重要',
        difficulty: ExerciseDifficulty.concept,
        prompt: '给计数器 Text 添加 ValueKey(count)，让 AnimatedSwitcher 在数字变化时播放过渡。',
        acceptanceCriteria: ['使用 ValueKey(count)', '数字变化时出现切换动画'],
      ),
      Exercise(
        id: '3-2',
        title: '加载按钮',
        difficulty: ExerciseDifficulty.basic,
        prompt: '在“提交”文本和 CircularProgressIndicator 之间添加切换动画。',
        acceptanceCriteria: ['两个 child 使用不同 Key', '切换后按钮尺寸稳定'],
      ),
      Exercise(
        id: '3-3',
        title: '方向感知计数器',
        difficulty: ExerciseDifficulty.application,
        prompt: '数字增加时从下方进入，减少时从上方进入。',
        acceptanceCriteria: ['支持加减操作', '进入方向由数值变化方向决定'],
      ),
      Exercise(
        id: '3-4',
        title: '通知队列',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '实现可快速连续切换消息的通知区域，并正确处理多个正在离场的 child。',
        acceptanceCriteria: ['消息拥有稳定唯一 Key', '快速操作无重叠异常', '自定义 layoutBuilder'],
      ),
    ],
  ),
  Chapter(
    id: 4,
    title: 'TweenAnimationBuilder',
    subtitle: '无需手动 Controller，也能动画任意类型的目标值',
    demoKind: DemoKind.tweenBuilder,
    concepts: [
      'Tween.end 改变时，会从当前动画值继续过渡到新目标值。',
      'builder 中只放依赖动画值的部分。',
      '不随动画变化的复杂子树应通过 child 参数复用。',
      'TweenAnimationBuilder 会接管传入 Tween，之后不应再修改同一实例。',
    ],
    codeSnippet: '''
TweenAnimationBuilder<double>(
  tween: Tween(end: target),
  duration: const Duration(milliseconds: 600),
  builder: (context, value, child) {
    return Transform.scale(scale: value, child: child);
  },
  child: const Icon(Icons.favorite),
)''',
    exercises: [
      Exercise(
        id: '4-1',
        title: '何时使用 Builder',
        difficulty: ExerciseDifficulty.concept,
        prompt: '并排实现目标值动画与可暂停动画，分别使用 TweenAnimationBuilder 和 AnimationController。',
        acceptanceCriteria: ['目标值 Demo 使用 TweenAnimationBuilder', '可暂停 Demo 使用 AnimationController'],
      ),
      Exercise(
        id: '4-2',
        title: '分数递增',
        difficulty: ExerciseDifficulty.basic,
        prompt: '把分数从当前值动画到新值，并显示为整数。',
        acceptanceCriteria: ['使用 double Tween', '动画过程中无跳变'],
      ),
      Exercise(
        id: '4-3',
        title: '环形进度',
        difficulty: ExerciseDifficulty.application,
        prompt: '用一个 TweenAnimationBuilder 同时驱动 CircularProgressIndicator 和百分比文本。',
        acceptanceCriteria: ['两处读同一个 value', '目标变化时从当前进度继续'],
      ),
      Exercise(
        id: '4-4',
        title: '颜色与圆角插值',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '自定义 Tween 或组合插值，实现温度卡片的颜色、圆角和数值同步过渡。',
        acceptanceCriteria: ['动画参数保持同步', '静态子树通过 child 复用', '支持多次改变目标'],
      ),
    ],
  ),
  Chapter(
    id: 5,
    title: 'AnimationController',
    subtitle: '精确控制播放、暂停、反向、循环与生命周期',
    demoKind: DemoKind.controller,
    concepts: [
      'Controller 需要 TickerProvider，单个控制器通常使用 SingleTickerProviderStateMixin。',
      '在 initState 创建，在 dispose 中释放。',
      'forward、reverse、stop、reset、repeat 覆盖大多数控制需求。',
      'AnimationStatusListener 适合串联动作或响应完成状态。',
    ],
    codeSnippet: '''
_controller = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 700),
);

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}''',
    exercises: [
      Exercise(
        id: '5-1',
        title: 'Ticker 与释放',
        difficulty: ExerciseDifficulty.concept,
        prompt: '把占位组件改为 StatefulWidget，创建并正确释放 AnimationController。',
        acceptanceCriteria: ['混入 SingleTickerProviderStateMixin', '在 dispose 中释放 Controller'],
      ),
      Exercise(
        id: '5-2',
        title: '旋转控制器',
        difficulty: ExerciseDifficulty.basic,
        prompt: '实现可播放、暂停、重置的刷新图标旋转动画。',
        acceptanceCriteria: ['使用 RotationTransition', '三个控制按钮行为正确'],
      ),
      Exercise(
        id: '5-3',
        title: '往返呼吸灯',
        difficulty: ExerciseDifficulty.application,
        prompt: '使用 repeat(reverse: true) 让透明度和缩放同步循环。',
        acceptanceCriteria: ['共用一个 Controller', '停止后可从当前进度继续'],
      ),
      Exercise(
        id: '5-4',
        title: '手势联动抽屉',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '让水平拖动实时更新 Controller.value，松手后根据速度或进度决定打开与关闭。',
        acceptanceCriteria: ['拖动值限制在 0～1', '松手决策合理', '支持反向动画'],
      ),
    ],
  ),
  Chapter(
    id: 6,
    title: 'Transitions 与 AnimatedBuilder',
    subtitle: '组合淡入、位移、缩放、旋转和自定义变换',
    demoKind: DemoKind.transitions,
    concepts: [
      'Transition Widget 直接接收 Animation，能避免手动 setState。',
      'SlideTransition 的 Offset 按 child 自身尺寸计算，而不是像素。',
      'AnimatedBuilder 适合没有现成 Transition 的组合变换。',
      'AnimatedBuilder.child 可避免静态子树每帧重建。',
    ],
    codeSnippet: '''
FadeTransition(
  opacity: opacity,
  child: SlideTransition(
    position: position,
    child: ScaleTransition(scale: scale, child: card),
  ),
)''',
    exercises: [
      Exercise(
        id: '6-1',
        title: 'Offset 的单位',
        difficulty: ExerciseDifficulty.concept,
        prompt: '并排实现 SlideTransition 与固定像素位移，并提供可调节 child 高度的对比控件。',
        acceptanceCriteria: ['SlideTransition 使用 Offset(0, 1)', '对比侧使用固定像素位移', '可调节 child 高度'],
      ),
      Exercise(
        id: '6-2',
        title: '底部入场',
        difficulty: ExerciseDifficulty.basic,
        prompt: '组合 FadeTransition 和 SlideTransition，让卡片从底部淡入。',
        acceptanceCriteria: ['两个动画共用 Controller', '使用 easeOut 曲线'],
      ),
      Exercise(
        id: '6-3',
        title: '复合图标动画',
        difficulty: ExerciseDifficulty.application,
        prompt: '用 AnimatedBuilder 同时改变旋转角、缩放和阴影。',
        acceptanceCriteria: ['静态图标作为 child', '动画值映射清晰'],
      ),
      Exercise(
        id: '6-4',
        title: '可复用入场组件',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '封装可配置方向、距离、曲线和时长的入场动画 Widget。',
        acceptanceCriteria: ['公开清晰的构造参数', '正确管理 Controller', '支持减少动态效果设置'],
      ),
    ],
  ),
  Chapter(
    id: 7,
    title: '页面转场与 Hero',
    subtitle: '定制 Route 进入退出，并在页面间共享视觉元素',
    demoKind: DemoKind.navigation,
    concepts: [
      '优先使用平台默认 Route，确有设计需求时再定制 PageRouteBuilder。',
      'transitionsBuilder 应复用传入的 child，不要每帧重建页面。',
      '两个页面的 Hero 必须使用相同且在各自 Route 内唯一的 tag。',
      '目标 Hero 应在新页面第一帧存在，外观差异过大会导致跳变。',
    ],
    codeSnippet: '''
PageRouteBuilder<void>(
  pageBuilder: (_, animation, __) => const DetailPage(),
  transitionsBuilder: (_, animation, __, child) {
    return FadeTransition(opacity: animation, child: child);
  },
)''',
    exercises: [
      Exercise(
        id: '7-1',
        title: '默认还是自定义',
        difficulty: ExerciseDifficulty.concept,
        prompt: '实现两个按钮：一个使用 MaterialPageRoute，一个使用自定义 PageRouteBuilder。',
        acceptanceCriteria: ['默认转场使用 MaterialPageRoute', '自定义转场使用 PageRouteBuilder'],
      ),
      Exercise(
        id: '7-2',
        title: '淡入页面',
        difficulty: ExerciseDifficulty.basic,
        prompt: '用 PageRouteBuilder 实现 300ms 的页面淡入和 200ms 的退出。',
        acceptanceCriteria: ['设置正反向时长', '复用 transitionsBuilder 的 child'],
      ),
      Exercise(
        id: '7-3',
        title: '商品图片 Hero',
        difficulty: ExerciseDifficulty.application,
        prompt: '让商品列表图片通过数据 ID 飞入详情页。',
        acceptanceCriteria: ['tag 来自商品 ID', '两个页面 tag 一致且唯一'],
      ),
      Exercise(
        id: '7-4',
        title: '卡片展开转场',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '组合 Hero、自定义 flightShuttleBuilder 和页面淡入，处理圆角变化。',
        acceptanceCriteria: ['飞行过程无明显闪烁', '返回动画正确', '快速返回不报错'],
      ),
    ],
  ),
  Chapter(
    id: 8,
    title: '交错动画与动态列表',
    subtitle: '使用 Interval 排列时间，并为列表插入删除添加动画',
    demoKind: DemoKind.staggeredList,
    concepts: [
      'Interval 使用 Controller 总时长的比例区间。',
      '多个 Animation 可由同一个 Controller 驱动，并在不同区间执行。',
      'AnimatedList 不管理数据，必须自己保持数据与动画索引同步。',
      '删除前要保存数据，removeItem 的 builder 才能渲染离场项。',
    ],
    codeSnippet: '''
final opacity = Tween<double>(begin: 0, end: 1).animate(
  CurvedAnimation(
    parent: controller,
    curve: const Interval(0, .4, curve: Curves.easeOut),
  ),
);''',
    exercises: [
      Exercise(
        id: '8-1',
        title: '三段入场',
        difficulty: ExerciseDifficulty.basic,
        prompt: '让透明度、位移和缩放分三个区间依次执行。',
        acceptanceCriteria: ['使用一个 Controller', '三个 Interval 合法且顺序明确'],
      ),
      Exercise(
        id: '8-2',
        title: '可增删清单',
        difficulty: ExerciseDifficulty.application,
        prompt: '使用 AnimatedList 实现头部插入和指定项删除。',
        acceptanceCriteria: ['数据与 AnimatedList 同步', '删除 builder 使用已保存数据'],
      ),
      Exercise(
        id: '8-3',
        title: '可重排任务板',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '处理连续快速插入、删除与空列表状态，确保索引始终正确。',
        acceptanceCriteria: ['快速操作不越界', '空状态切换有动画', '每项使用稳定 Key'],
      ),
    ],
  ),
  Chapter(
    id: 9,
    title: '性能、无障碍与测试',
    subtitle: '让动画流畅、可访问、可验证，并避开常见生命周期错误',
    demoKind: DemoKind.engineering,
    concepts: [
      '把不变化的子树放入 builder 的 child，减少每帧重建。',
      '复杂绘制可用 RepaintBoundary 隔离重绘，但不要滥用。',
      '读取 MediaQuery.disableAnimations，为减少动态效果的用户提供替代。',
      'Widget 测试用 pump 推进确定时长，不依赖真实时间。',
    ],
    codeSnippet: '''
final reduceMotion = MediaQuery.disableAnimationsOf(context);

AnimatedContainer(
  duration: reduceMotion ? Duration.zero : const Duration(milliseconds: 300),
  // ...
)''',
    exercises: [
      Exercise(
        id: '9-1',
        title: '定位重建成本',
        difficulty: ExerciseDifficulty.concept,
        prompt: '把静态图标移到 AnimatedBuilder.child，避免每帧重建。',
        acceptanceCriteria: ['静态 Icon 通过 child 参数传入', 'builder 只依赖动画值'],
      ),
      Exercise(
        id: '9-2',
        title: '支持减少动态效果',
        difficulty: ExerciseDifficulty.basic,
        prompt: '让位移动画在 disableAnimations 时改为立即切换或仅淡入。',
        acceptanceCriteria: ['读取系统设置', '替代效果仍表达状态变化'],
      ),
      Exercise(
        id: '9-3',
        title: '确定性动画测试',
        difficulty: ExerciseDifficulty.application,
        prompt: '测试一个 400ms 宽度动画在 0ms、200ms、400ms 三个时点的状态。',
        acceptanceCriteria: ['使用 pump(Duration)', '不使用真实等待', '包含误差范围'],
      ),
      Exercise(
        id: '9-4',
        title: '动画代码审查',
        difficulty: ExerciseDifficulty.challenge,
        prompt: '重构有问题的动画实现：复用静态子树，并在合适处支持 disableAnimations。',
        acceptanceCriteria: ['静态子树通过 child 复用', '支持减少动态效果', '去掉没有依据的复杂度'],
      ),
    ],
  ),
];
