import 'dart:async';

import 'package:flutter/material.dart';

import '../exercise_workspace.dart';

class Exercise34Page extends StatelessWidget {
  const Exercise34Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseWorkspace(
      exerciseId: '3-4',
      title: '通知队列',
      filePath: 'lib/exercises/chapter_03/exercise_3_4.dart',
      tasks: [
        '实现能快速连续切换消息的 AnimatedSwitcher。',
        '每条消息使用唯一业务 Key。',
        '自定义 layoutBuilder，避免离场消息破坏布局。',
      ],
      child: _NotificationQueue(),
    );
  }
}

class _NotificationMessage {
  const _NotificationMessage({
    required this.id,
    required this.title,
    required this.body,
    required this.icon,
    required this.color,
  });

  final int id;
  final String title;
  final String body;
  final IconData icon;
  final Color color;
}

class _NotificationQueue extends StatefulWidget {
  const _NotificationQueue();

  @override
  State<_NotificationQueue> createState() => _NotificationQueueState();
}

class _NotificationQueueState extends State<_NotificationQueue> {
  static const _templates = [
    (
      title: '新消息',
      body: '张三：晚上一起看代码吗？',
      icon: Icons.chat_bubble_outline,
      color: Colors.blue,
    ),
    (
      title: '构建成功',
      body: 'main 分支的流水线已经跑完。',
      icon: Icons.check_circle_outline,
      color: Colors.green,
    ),
    (
      title: '磁盘告警',
      body: '剩余空间不足 10%，请及时清理缓存文件。',
      icon: Icons.warning_amber_outlined,
      color: Colors.orange,
    ),
    (
      title: '日程提醒',
      body: '15:30 团队周会。',
      icon: Icons.event_available_outlined,
      color: Colors.purple,
    ),
  ];

  int _nextId = 0;
  _NotificationMessage? _current;
  Timer? _burstTimer;

  @override
  void dispose() {
    _burstTimer?.cancel();
    super.dispose();
  }

  void _push() {
    final template = _templates[_nextId % _templates.length];
    setState(() {
      _current = _NotificationMessage(
        id: _nextId++,
        title: template.title,
        body: template.body,
        icon: template.icon,
        color: template.color,
      );
    });
  }

  /// 每 140ms 推送一条，用来验证动画未结束时继续切换是否会出问题。
  void _burst() {
    _burstTimer?.cancel();
    var remaining = 4;
    _push();
    _burstTimer = Timer.periodic(const Duration(milliseconds: 140), (timer) {
      _push();
      if (--remaining == 0) {
        timer.cancel();
      }
    });
  }

  void _clear() {
    _burstTimer?.cancel();
    setState(() => _current = null);
  }

  @override
  Widget build(BuildContext context) {
    final current = _current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 320),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.35),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          layoutBuilder: (currentChild, previousChildren) {
            // 离场的消息交给 Positioned，让它退出 Stack 的尺寸计算，
            // 这样长短不一的消息连续切换时高度不会来回跳。
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                for (final child in previousChildren)
                  Positioned(left: 0, right: 0, top: 0, child: child),
                ?currentChild,
              ],
            );
          },
          child: current == null
              ? const _EmptyHint(key: ValueKey('empty'))
              // 业务唯一 Key：即使文案重复，id 不同也会触发切换动画。
              : _NotificationCard(key: ValueKey(current.id), message: current),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: [
            FilledButton.icon(
              onPressed: _push,
              icon: const Icon(Icons.add_alert_outlined),
              label: const Text('推送一条'),
            ),
            FilledButton.tonalIcon(
              onPressed: _burst,
              icon: const Icon(Icons.bolt_outlined),
              label: const Text('连发 5 条'),
            ),
            TextButton.icon(
              onPressed: current == null ? null : _clear,
              icon: const Icon(Icons.clear_all),
              label: const Text('清空'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '已推送 $_nextId 条',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({super.key, required this.message});

  final _NotificationMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: message.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: message.color.withValues(alpha: 0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(message.icon, color: message.color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(message.body),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text('#${message.id}', style: TextStyle(color: message.color)),
        ],
      ),
    );
  }
}

class _EmptyHint extends StatelessWidget {
  const _EmptyHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: const Text('暂无通知，点击下方按钮试试连续推送。'),
    );
  }
}
