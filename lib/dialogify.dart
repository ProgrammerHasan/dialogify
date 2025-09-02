import 'dart:ui';
import 'package:flutter/material.dart';

enum DialogType { info, confirmation }
enum DialogPosition { center, bottom }

Future<void> showConfirmationDialog(
    BuildContext context, {
      String? title,
      String? subtitle,
      String? confirmText,
      String? cancelText,
      VoidCallback? onConfirm,
      VoidCallback? onCancel,
      DialogPosition position = DialogPosition.bottom,
      Widget? content,
      BoxDecoration? decoration,
      TextStyle? titleStyle,
      TextStyle? subtitleStyle,
      double? contentPadding,
      bool? divider,
      Color? dividerColor,
      List<Color>? gradientColors,
    }) {
  if (position == DialogPosition.bottom) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: IntrinsicHeight(
            child: _BaseDialog(
              title: title,
              subtitle: subtitle,
              confirmText: confirmText,
              onConfirm: onConfirm,
              onCancel: onCancel,
              cancelText: cancelText,
              position: position,
              content: content,
              decoration: decoration,
              titleStyle: titleStyle,
              subtitleStyle: subtitleStyle,
              contentPadding: contentPadding,
              divider: divider ?? false,
              dividerColor: dividerColor,
              gradientColors: gradientColors,
              type: DialogType.confirmation,
            ),
          ),
        );
      },
    );
  } else {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _AnimatedDialog(
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(16),
            child: _BaseDialog(
              title: title,
              subtitle: subtitle,
              confirmText: confirmText,
              onConfirm: onConfirm,
              onCancel: onCancel,
              cancelText: cancelText,
              position: position,
              content: content,
              decoration: decoration,
              titleStyle: titleStyle,
              subtitleStyle: subtitleStyle,
              contentPadding: contentPadding,
              divider: divider ?? false,
              dividerColor: dividerColor,
              gradientColors: gradientColors,
              type: DialogType.confirmation,
            ),
          ),
        );
      },
    );
  }
}

Future<void> showInfoDialog(
    BuildContext context, {
      String? title,
      String? subtitle,
      String? closeText,
      VoidCallback? onClose,
      DialogPosition position = DialogPosition.center,
      Widget? content,
      BoxDecoration? decoration,
      TextStyle? titleStyle,
      TextStyle? subtitleStyle,
      double? contentPadding,
      bool? divider,
      Color? dividerColor,
      List<Color>? gradientColors,
    }) {
  if (position == DialogPosition.bottom) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: IntrinsicHeight(
            child: _BaseDialog(
              title: title,
              subtitle: subtitle,
              closeText: closeText,
              onClose: onClose,
              position: position,
              content: content,
              decoration: decoration,
              titleStyle: titleStyle,
              subtitleStyle: subtitleStyle,
              contentPadding: contentPadding,
              divider: divider ?? false,
              dividerColor: dividerColor,
              gradientColors: gradientColors,
              type: DialogType.info,
            ),
          ),
        );
      },
    );
  } else {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _AnimatedDialog(
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(16),
            child: _BaseDialog(
              title: title,
              subtitle: subtitle,
              closeText: closeText,
              onClose: onClose,
              position: position,
              content: content,
              decoration: decoration,
              titleStyle: titleStyle,
              subtitleStyle: subtitleStyle,
              contentPadding: contentPadding,
              divider: divider ?? false,
              dividerColor: dividerColor,
              gradientColors: gradientColors,
              type: DialogType.info,
            ),
          ),
        );
      },
    );
  }
}

class _BaseDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? confirmText;
  final String? cancelText;
  final String? closeText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final VoidCallback? onClose;
  final DialogPosition? position;
  final DialogType? type;
  final Widget? content;
  final BoxDecoration? decoration;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double? contentPadding;
  final bool divider;
  final Color? dividerColor;
  final List<Color>? gradientColors;

  const _BaseDialog({
    this.title,
    this.subtitle,
    this.confirmText,
    this.cancelText,
    this.closeText,
    this.onConfirm,
    this.onCancel,
    this.onClose,
    this.position,
    this.type,
    this.content,
    this.decoration,
    this.titleStyle,
    this.subtitleStyle,
    this.contentPadding,
    this.divider = false,
    this.dividerColor,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        width: double.infinity,
        padding: (contentPadding != null) ? EdgeInsets.all(contentPadding!).copyWith(bottom: 12) : const EdgeInsets.fromLTRB(16, 16, 16, 10),
        decoration: decoration ?? BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ?? [
              Color(0xFF09B65F),
              Color(0xFF22A183),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: position == DialogPosition.center ? Border.all(
            color: Color(0xFF139A74),
            width: 2,
          ) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(content == null) ... [
                Text(
                  title ?? "Are you sure?",
                  style: titleStyle ?? theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle ?? "Please confirm this action.",
                  style: subtitleStyle ?? TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
              ] else content ?? const SizedBox.shrink(),
              if(divider) ... [
                Divider(color: dividerColor ?? Colors.white12, height: 1),
                SizedBox(height: 6),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(type == DialogType.info) ... [
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onClose?.call();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        foregroundColor: Colors.white70,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        visualDensity: VisualDensity.comfortable,
                      ),
                      icon: const Icon(Icons.close_rounded, size: 18),
                      label: Text(closeText ?? "Close"),
                    ),
                  ],
                  if(type == DialogType.confirmation) ... [
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onCancel?.call();
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                          foregroundColor: Colors.white70,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          visualDensity: VisualDensity.comfortable
                      ),
                      icon: const Icon(Icons.close_rounded, size: 18),
                      label: Text(cancelText ?? "Cancel"),
                    ),
                    const SizedBox(width: 16),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onConfirm?.call();
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: Color(0xFF0AC466),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          visualDensity: VisualDensity.comfortable
                      ),
                      icon: const Icon(Icons.check_circle_rounded, size: 18),
                      label: Text(confirmText ?? "Yes, Confirm"),
                    ),
                  ],
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedDialog extends StatefulWidget {
  final Widget child;
  const _AnimatedDialog({required this.child});

  @override
  State<_AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<_AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
      child: FadeTransition(
        opacity: _controller,
        child: widget.child,
      ),
    );
  }
}