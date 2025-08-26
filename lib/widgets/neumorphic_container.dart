import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final bool isPressed;
  final VoidCallback? onTap;

  const NeumorphicContainer({
    super.key,
    required this.child,
    this.borderRadius = 50.0,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.isPressed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = backgroundColor ?? AppColors.background;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow:
              isPressed
                  ? [
                    // Efecto presionado - sombras internas
                    BoxShadow(
                      color: Colors.white.withOpacity(0.7),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                  : [
                    // Efecto normal - sombras externas
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(20, 20),
                      blurRadius: 60,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.7),
                      offset: const Offset(-20, -20),
                      blurRadius: 60,
                      spreadRadius: 0,
                    ),
                  ],
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}

class NeumorphicCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final bool isPressed;
  final VoidCallback? onTap;

  const NeumorphicCard({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.isPressed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = backgroundColor ?? AppColors.background;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow:
              isPressed
                  ? [
                    // Efecto presionado - sombras internas
                    BoxShadow(
                      color: Colors.white.withOpacity(0.7),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                  : [
                    // Efecto normal - sombras externas
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(15, 15),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.7),
                      offset: const Offset(-15, -15),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ],
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}

class NeumorphicButton extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const NeumorphicButton({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color baseColor = widget.backgroundColor ?? AppColors.orange500;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed?.call();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow:
              _isPressed
                  ? [
                    // Efecto presionado - sombras internas
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                  : [
                    // Efecto normal - sombras externas
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(8, 8),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      offset: const Offset(-8, -8),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
        ),
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
