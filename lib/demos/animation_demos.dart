import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/learning_models.dart';

class DemoForKind extends StatelessWidget {
  const DemoForKind({super.key, required this.kind});

  final DemoKind kind;

  @override
  Widget build(BuildContext context) {
    return switch (kind) {
      DemoKind.core => const CoreConceptDemo(),
      DemoKind.implicit => const ImplicitAnimationDemo(),
      DemoKind.switcher => const SwitcherDemo(),
      DemoKind.tweenBuilder => const TweenBuilderDemo(),
      DemoKind.controller => const ControllerDemo(),
      DemoKind.transitions => const TransitionsDemo(),
      DemoKind.navigation => const NavigationDemo(),
      DemoKind.staggeredList => const StaggeredListDemo(),
      DemoKind.engineering => const EngineeringDemo(),
    };
  }
}

class _DemoSurface extends StatelessWidget {
  const _DemoSurface({
    required this.title,
    required this.description,
    required this.child,
  });

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}

class CoreConceptDemo extends StatefulWidget {
  const CoreConceptDemo({super.key});

  @override
  State<CoreConceptDemo> createState() => _CoreConceptDemoState();
}

class _CoreConceptDemoState extends State<CoreConceptDemo> {
  double _progress = 0.35;
  String _curveName = 'easeOutCubic';

  Curve get _curve => switch (_curveName) {
    'linear' => Curves.linear,
    'easeInOut' => Curves.easeInOut,
    'easeOutBack' => Curves.easeOutBack,
    _ => Curves.easeOutCubic,
  };

  @override
  Widget build(BuildContext context) {
    final curvedProgress = _curve.transform(_progress);
    final mappedWidth = 64 + (220 - 64) * curvedProgress;
    return _DemoSurface(
      title: '进度映射实验',
      description: '拖动 Controller 进度，观察 Curve 变换后再由 Tween 映射出的宽度。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Curve'),
              const SizedBox(width: 16),
              DropdownButton<String>(
                value: _curveName,
                items: const [
                  DropdownMenuItem(value: 'linear', child: Text('linear')),
                  DropdownMenuItem(
                    value: 'easeOutCubic',
                    child: Text('easeOutCubic'),
                  ),
                  DropdownMenuItem(
                    value: 'easeInOut',
                    child: Text('easeInOut'),
                  ),
                  DropdownMenuItem(
                    value: 'easeOutBack',
                    child: Text('easeOutBack'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _curveName = value);
                },
              ),
            ],
          ),
          Slider(
            key: const ValueKey('core-progress-slider'),
            value: _progress,
            label: _progress.toStringAsFixed(2),
            onChanged: (value) => setState(() => _progress = value),
          ),
          const SizedBox(height: 12),
          Container(
            width: mappedWidth,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 16),
          Text('Controller：${_progress.toStringAsFixed(2)}'),
          Text('Curve 输出：${curvedProgress.toStringAsFixed(2)}'),
          Text('Tween 宽度：${mappedWidth.toStringAsFixed(0)} px'),
        ],
      ),
    );
  }
}

class ImplicitAnimationDemo extends StatefulWidget {
  const ImplicitAnimationDemo({super.key});

  @override
  State<ImplicitAnimationDemo> createState() => _ImplicitAnimationDemoState();
}

class _ImplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
  bool _expanded = false;

  void _reset() => setState(() => _expanded = false);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return _DemoSurface(
      title: '一份状态，四种隐式过渡',
      description: 'AnimatedContainer、Opacity、Align 和 Positioned 由同一个布尔状态驱动。',
      child: Column(
        children: [
          SizedBox(
            height: 230,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic,
                  left: _expanded ? 28 : 0,
                  top: _expanded ? 110 : 0,
                  child: AnimatedContainer(
                    key: const ValueKey('implicit-box'),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutCubic,
                    width: _expanded ? 240 : 120,
                    height: _expanded ? 100 : 72,
                    alignment: _expanded
                        ? Alignment.centerRight
                        : Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _expanded
                          ? colors.primaryContainer
                          : colors.secondaryContainer,
                      borderRadius: BorderRadius.circular(_expanded ? 28 : 12),
                    ),
                    child: AnimatedOpacity(
                      opacity: _expanded ? 1 : 0.55,
                      duration: const Duration(milliseconds: 350),
                      child: Text(
                        _expanded ? '展开状态' : '折叠',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 12,
            children: [
              FilledButton.icon(
                key: const ValueKey('toggle-implicit'),
                onPressed: () => setState(() => _expanded = !_expanded),
                icon: const Icon(Icons.swap_horiz),
                label: const Text('切换状态'),
              ),
              OutlinedButton(onPressed: _reset, child: const Text('重置')),
            ],
          ),
        ],
      ),
    );
  }
}

class SwitcherDemo extends StatefulWidget {
  const SwitcherDemo({super.key});

  @override
  State<SwitcherDemo> createState() => _SwitcherDemoState();
}

class _SwitcherDemoState extends State<SwitcherDemo> {
  int _count = 0;
  bool _useSlide = true;

  @override
  Widget build(BuildContext context) {
    return _DemoSurface(
      title: '拥有身份的数字',
      description: 'ValueKey 让 AnimatedSwitcher 知道数字 child 已经更换。',
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, animation) {
                  if (!_useSlide) {
                    return ScaleTransition(scale: animation, child: child);
                  }
                  final slide =
                      Tween<Offset>(
                        begin: const Offset(0, 0.65),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutCubic,
                        ),
                      );
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(position: slide, child: child),
                  );
                },
                child: Text(
                  '$_count',
                  key: ValueKey<int>(_count),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: true, label: Text('滑动 + 淡入')),
              ButtonSegment(value: false, label: Text('缩放')),
            ],
            selected: {_useSlide},
            onSelectionChanged: (value) {
              setState(() => _useSlide = value.first);
            },
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            children: [
              IconButton.filledTonal(
                key: const ValueKey('decrement-counter'),
                onPressed: () => setState(() => _count--),
                icon: const Icon(Icons.remove),
                tooltip: '减少',
              ),
              IconButton.filled(
                key: const ValueKey('increment-counter'),
                onPressed: () => setState(() => _count++),
                icon: const Icon(Icons.add),
                tooltip: '增加',
              ),
              TextButton(
                onPressed: () => setState(() => _count = 0),
                child: const Text('重置'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TweenBuilderDemo extends StatefulWidget {
  const TweenBuilderDemo({super.key});

  @override
  State<TweenBuilderDemo> createState() => _TweenBuilderDemoState();
}

class _TweenBuilderDemoState extends State<TweenBuilderDemo> {
  double _target = 0.25;

  @override
  Widget build(BuildContext context) {
    return _DemoSurface(
      title: '目标进度',
      description: '只更新 Tween.end，组件会从当前值平滑过渡到新目标。',
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            key: const ValueKey('progress-tween'),
            tween: Tween<double>(end: _target),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Column(
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: value,
                          strokeWidth: 10,
                        ),
                        Center(
                          child: Text(
                            '${(value * 100).round()}%',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Transform.scale(scale: 0.8 + value * 0.3, child: child),
                ],
              );
            },
            child: const Icon(Icons.rocket_launch, size: 40),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              for (final target in [0.25, 0.5, 0.75, 1.0])
                ChoiceChip(
                  label: Text('${(target * 100).round()}%'),
                  selected: _target == target,
                  onSelected: (_) => setState(() => _target = target),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ControllerDemo extends StatefulWidget {
  const ControllerDemo({super.key});

  @override
  State<ControllerDemo> createState() => _ControllerDemoState();
}

class _ControllerDemoState extends State<ControllerDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _scale;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 900),
        )..addStatusListener((status) {
          if (mounted) setState(() => _status = status);
        });
    _opacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.65, curve: Curves.easeOut),
    );
    _scale = Tween<double>(
      begin: 0.6,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DemoSurface(
      title: '显式控制台',
      description: '同一个 Controller 同步驱动透明度和缩放，并暴露常用控制方法。',
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Center(
              child: FadeTransition(
                opacity: _opacity,
                child: ScaleTransition(
                  scale: _scale,
                  child: Icon(
                    Icons.flutter_dash,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (_, _) => Text(
              '进度 ${_controller.value.toStringAsFixed(2)} · ${_status.name}',
              key: const ValueKey('controller-status'),
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              FilledButton(
                key: const ValueKey('controller-forward'),
                onPressed: _controller.forward,
                child: const Text('播放'),
              ),
              OutlinedButton(
                key: const ValueKey('controller-reverse'),
                onPressed: _controller.reverse,
                child: const Text('反向'),
              ),
              OutlinedButton(
                onPressed: _controller.stop,
                child: const Text('暂停'),
              ),
              TextButton(
                key: const ValueKey('controller-reset'),
                onPressed: _controller.reset,
                child: const Text('重置'),
              ),
              TextButton(
                onPressed: () => _controller.repeat(reverse: true),
                child: const Text('往返循环'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransitionsDemo extends StatefulWidget {
  const TransitionsDemo({super.key});

  @override
  State<TransitionsDemo> createState() => _TransitionsDemoState();
}

class _TransitionsDemoState extends State<TransitionsDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _scale;
  late final Animation<Offset> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _opacity = curved;
    _scale = Tween<double>(begin: 0.7, end: 1).animate(curved);
    _position = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(curved);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return _DemoSurface(
      title: 'Transition 组合',
      description: 'Fade、Slide、Scale 负责常见属性，AnimatedBuilder 补充旋转。',
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: Center(
              child: FadeTransition(
                opacity: _opacity,
                child: SlideTransition(
                  position: _position,
                  child: ScaleTransition(
                    scale: _scale,
                    child: AnimatedBuilder(
                      animation: _controller,
                      child: Icon(
                        Icons.auto_awesome,
                        size: 64,
                        color: colors.onPrimaryContainer,
                      ),
                      builder: (_, child) => Transform.rotate(
                        angle: _controller.value * math.pi * 2,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: colors.primaryContainer,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: _controller.value * 18,
                                color: colors.primary.withValues(alpha: 0.25),
                              ),
                            ],
                          ),
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            spacing: 10,
            children: [
              FilledButton.icon(
                onPressed: () => _controller.forward(from: 0),
                icon: const Icon(Icons.play_arrow),
                label: const Text('播放组合'),
              ),
              OutlinedButton(
                onPressed: _controller.reverse,
                child: const Text('反向'),
              ),
              TextButton(onPressed: _controller.reset, child: const Text('重置')),
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({super.key});

  static const _heroTag = 'lab-hero-card';

  @override
  Widget build(BuildContext context) {
    return _DemoSurface(
      title: '共享元素进入详情页',
      description: '点击卡片，观察自定义 Route 的淡入滑动和 Hero 飞行动画。',
      child: Center(
        child: InkWell(
          key: const ValueKey('open-hero-detail'),
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder<void>(
                transitionDuration: const Duration(milliseconds: 500),
                reverseTransitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (_, _, _) => const _HeroDetailPage(),
                transitionsBuilder: (_, animation, _, child) {
                  final curved = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                    reverseCurve: Curves.easeInCubic,
                  );
                  final position = Tween<Offset>(
                    begin: const Offset(0.08, 0.05),
                    end: Offset.zero,
                  ).animate(curved);
                  return FadeTransition(
                    opacity: curved,
                    child: SlideTransition(position: position, child: child),
                  );
                },
              ),
            );
          },
          child: Hero(
            tag: _heroTag,
            child: Material(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(24),
              child: const SizedBox(
                width: 220,
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.landscape, size: 54),
                    SizedBox(height: 8),
                    Text('打开 Hero 详情'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroDetailPage extends StatelessWidget {
  const _HeroDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero 详情')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Hero(
            tag: NavigationDemo._heroTag,
            child: Material(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(32),
              child: const SizedBox(
                height: 280,
                child: Icon(Icons.landscape, size: 120),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '相同的 Hero tag 把两个页面中的元素连接起来。',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          const Text('返回时，同一个共享元素会沿相反方向飞回原位置。'),
        ],
      ),
    );
  }
}

class StaggeredListDemo extends StatefulWidget {
  const StaggeredListDemo({super.key});

  @override
  State<StaggeredListDemo> createState() => _StaggeredListDemoState();
}

class _StaggeredListDemoState extends State<StaggeredListDemo>
    with SingleTickerProviderStateMixin {
  final _listKey = GlobalKey<AnimatedListState>();
  final _items = <String>['理解 Interval', '同步数据索引'];
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _position;
  late final Animation<double> _scale;
  int _nextItem = 3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.4, curve: Curves.easeOut),
      ),
    );
    _position = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.2, 0.75, curve: Curves.easeOutCubic),
          ),
        );
    _scale = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 1, curve: Curves.easeOutBack),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _insertItem() {
    _items.insert(0, '新任务 ${_nextItem++}');
    _listKey.currentState?.insertItem(
      0,
      duration: const Duration(milliseconds: 350),
    );
  }

  void _removeItem() {
    if (_items.isEmpty) return;
    final index = _items.length - 1;
    final removed = _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _AnimatedListTile(
        label: removed,
        animation: animation,
        removing: true,
      ),
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _DemoSurface(
      title: '时间编排 + 列表变更',
      description: '先重播交错入场，再试着插入和删除列表项。',
      child: Column(
        children: [
          FadeTransition(
            opacity: _opacity,
            child: SlideTransition(
              position: _position,
              child: ScaleTransition(
                scale: _scale,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.view_timeline),
                      SizedBox(width: 12),
                      Expanded(child: Text('透明度 → 位移 → 缩放')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () => _controller.forward(from: 0),
            icon: const Icon(Icons.replay),
            label: const Text('重播交错动画'),
          ),
          const Divider(height: 28),
          SizedBox(
            height: 190,
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) =>
                  _AnimatedListTile(label: _items[index], animation: animation),
            ),
          ),
          Wrap(
            spacing: 10,
            children: [
              FilledButton.icon(
                key: const ValueKey('insert-list-item'),
                onPressed: _insertItem,
                icon: const Icon(Icons.add),
                label: const Text('头部插入'),
              ),
              OutlinedButton.icon(
                key: const ValueKey('remove-list-item'),
                onPressed: _items.isEmpty ? null : _removeItem,
                icon: const Icon(Icons.remove),
                label: const Text('删除末项'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedListTile extends StatelessWidget {
  const _AnimatedListTile({
    required this.label,
    required this.animation,
    this.removing = false,
  });

  final String label;
  final Animation<double> animation;
  final bool removing;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: ListTile(
          dense: true,
          leading: Icon(removing ? Icons.delete_outline : Icons.check_circle),
          title: Text(label),
        ),
      ),
    );
  }
}

class EngineeringDemo extends StatefulWidget {
  const EngineeringDemo({super.key});

  @override
  State<EngineeringDemo> createState() => _EngineeringDemoState();
}

class _EngineeringDemoState extends State<EngineeringDemo> {
  bool _active = false;
  bool _simulateReduceMotion = false;

  @override
  Widget build(BuildContext context) {
    final systemReduceMotion = MediaQuery.disableAnimationsOf(context);
    final reduceMotion = systemReduceMotion || _simulateReduceMotion;
    final duration = reduceMotion
        ? Duration.zero
        : const Duration(milliseconds: 650);
    final colors = Theme.of(context).colorScheme;

    return _DemoSurface(
      title: '减少动态效果',
      description: '模拟系统设置，比较完整动画与立即表达状态变化的替代方案。',
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('模拟“减少动态效果”'),
            subtitle: Text(
              systemReduceMotion ? '系统已开启，本地开关不会覆盖它' : '仅影响当前 Demo',
            ),
            value: _simulateReduceMotion,
            onChanged: (value) {
              setState(() => _simulateReduceMotion = value);
            },
          ),
          const SizedBox(height: 16),
          Semantics(
            liveRegion: true,
            label: _active ? '卡片已激活' : '卡片未激活',
            child: RepaintBoundary(
              child: AnimatedContainer(
                key: const ValueKey('engineering-box'),
                duration: duration,
                curve: Curves.easeOutCubic,
                width: _active ? 260 : 130,
                height: 96,
                alignment: _active
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: _active
                      ? colors.tertiaryContainer
                      : colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(_active ? 30 : 12),
                ),
                child: const Icon(Icons.accessibility_new, size: 42),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(reduceMotion ? '当前：立即切换' : '当前：650ms 平滑过渡'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            children: [
              FilledButton(
                key: const ValueKey('toggle-engineering'),
                onPressed: () => setState(() => _active = !_active),
                child: const Text('改变状态'),
              ),
              TextButton(
                onPressed: () => setState(() => _active = false),
                child: const Text('重置'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
