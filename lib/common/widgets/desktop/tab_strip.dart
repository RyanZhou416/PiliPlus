import 'package:PiliPlus/common/widgets/desktop/tab_manager.dart';
import 'package:PiliPlus/common/widgets/desktop/tab_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabStrip extends StatelessWidget {
  const TabStrip({super.key, required this.tabManager});

  final TabManager tabManager;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final tabs = tabManager.tabs;
      final active = tabManager.activeIndex.value;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < tabs.length; i++)
            _TabItem(
              tab: tabs[i],
              isActive: i == active,
              onTap: () => tabManager.switchTo(i),
              onClose: tabs[i].pinned ? null : () => tabManager.closeTab(i),
            ),
          _NewTabButton(onTap: () => tabManager.openTab('/home')),
        ],
      );
    });
  }
}

class _TabItem extends StatefulWidget {
  const _TabItem({
    required this.tab,
    required this.isActive,
    required this.onTap,
    this.onClose,
  });

  final TabModel tab;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onClose;

  @override
  State<_TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 200,
            minWidth: 40,
          ),
          height: 32,
          margin: const EdgeInsets.only(top: 4, right: 1),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: widget.isActive
                ? colorScheme.surface
                : (_hovering
                    ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
                    : Colors.transparent),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.tab.icon != null && widget.tab.pinned)
                Icon(
                  widget.tab.icon,
                  size: 16,
                  color: widget.isActive
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
              if (!widget.tab.pinned) ...[
                Flexible(
                  child: Obx(() => Text(
                    widget.tab.title.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: widget.isActive
                          ? colorScheme.onSurface
                          : colorScheme.onSurfaceVariant,
                    ),
                  )),
                ),
                if (_hovering || widget.isActive)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: GestureDetector(
                      onTap: widget.onClose,
                      child: Icon(
                        Icons.close,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NewTabButton extends StatefulWidget {
  const _NewTabButton({required this.onTap});

  final VoidCallback onTap;

  @override
  State<_NewTabButton> createState() => _NewTabButtonState();
}

class _NewTabButtonState extends State<_NewTabButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 28,
          height: 28,
          margin: const EdgeInsets.only(left: 4, top: 4),
          decoration: BoxDecoration(
            color: _hovering
                ? colorScheme.surfaceContainerHighest
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 18,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
