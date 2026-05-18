import 'dart:io';

import 'package:PiliPlus/common/widgets/desktop/tab_manager.dart';
import 'package:PiliPlus/common/widgets/desktop/tab_strip.dart';
import 'package:PiliPlus/common/widgets/desktop/window_controls.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class DesktopTitleBar extends StatelessWidget {
  const DesktopTitleBar({super.key, required this.tabManager});

  static final bool _isMacOS = Platform.isMacOS;
  static final double height = _isMacOS ? 28 : 38;
  static const double _macTrafficLightWidth = 78;

  final TabManager tabManager;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: height,
      color: colorScheme.surfaceContainerLow,
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (_) => windowManager.startDragging(),
            onDoubleTap: _toggleMaximize,
            child: SizedBox(
              width: _isMacOS ? _macTrafficLightWidth : 12,
              height: height,
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (_) => windowManager.startDragging(),
              onDoubleTap: _toggleMaximize,
              child: SizedBox(
                height: height,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabStrip(tabManager: tabManager),
                ),
              ),
            ),
          ),
          if (!_isMacOS) const WindowControls(),
        ],
      ),
    );
  }

  Future<void> _toggleMaximize() async {
    if (await windowManager.isMaximized()) {
      await windowManager.unmaximize();
    } else {
      await windowManager.maximize();
    }
  }
}
