import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatefulWidget {
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;
  final bool glassmorphism;
  final bool bob;

  GlassmorphicContainer({
    super.key,
    this.alignment,
    this.padding,
    this.color,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.glassmorphism = true,
    this.bob = true,
  }) : assert(!(glassmorphism && clipBehavior != Clip.none));

  @override
  _GlassmorphicContainerState createState() => _GlassmorphicContainerState();
}

class _GlassmorphicContainerState extends State<GlassmorphicContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _bobController;
  late Animation<double> _bobAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.bob) {
      _bobController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
      )..repeat(reverse: true);

      _bobAnimation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        parent: _bobController,
        curve: Curves.easeInOut,
      ));
    }
  }

  @override
  void dispose() {
    if (widget.bob) {
      _bobController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget current = widget.child ?? SizedBox.shrink();

    // Apply alignment and padding
    if (widget.alignment != null) {
      current = Align(alignment: widget.alignment!, child: current);
    }

    if (widget.padding != null) {
      current = Padding(padding: widget.padding!, child: current);
    }

    // Apply glassmorphism effect if enabled
    if (widget.glassmorphism) {
      Color bgColor = widget.color ?? Colors.white.withOpacity(0.1);
      if (bgColor.opacity > 0.8) {
        bgColor = bgColor.withOpacity(0.1);
      }

      current = Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: ColoredBox(color: bgColor),
            ),
          ),
          current,
        ],
      );
    }

    // Apply bobbing animation if enabled
    if (widget.bob) {
      current = AnimatedBuilder(
        animation: _bobAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _bobAnimation.value),
            child: child,
          );
        },
        child: current,
      );
    }

    // Apply margin, constraints, and transform if provided
    if (widget.constraints != null) {
      current = ConstrainedBox(constraints: widget.constraints!, child: current);
    }

    if (widget.margin != null) {
      current = Padding(padding: widget.margin!, child: current);
    }

    if (widget.transform != null) {
      current = Transform(
        transform: widget.transform!,
        alignment: widget.transformAlignment,
        child: current,
      );
    }

    return current;
  }
}
