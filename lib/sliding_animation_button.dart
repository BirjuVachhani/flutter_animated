// Author: Birju Vachhani
// Created Date: March 23, 2021

import 'package:flutter/material.dart';

enum AnimatedButtonState { enabled, disabled }

@immutable
class SlidingAnimationButtonStyle {
  final String text;
  final Color background;
  final Color? textColor;

  SlidingAnimationButtonStyle({
    required this.text,
    required this.background,
    required this.textColor,
  });

  SlidingAnimationButtonStyle.disabled({
    required this.text,
    this.background = Colors.black,
    this.textColor = Colors.white,
  });

  SlidingAnimationButtonStyle.enabled({
    required this.text,
    this.background = Colors.white,
    this.textColor,
  });
}

class SlidingAnimationButton extends StatefulWidget {
  final AnimatedButtonState state;
  final VoidCallback onTap;
  final SlidingAnimationButtonStyle enabled;
  final SlidingAnimationButtonStyle disabled;

  const SlidingAnimationButton({
    Key? key,
    this.state = AnimatedButtonState.enabled,
    required this.onTap,
    required this.enabled,
    required this.disabled,
  }) : super(key: key);

  @override
  _SlidingAnimationButtonState createState() => _SlidingAnimationButtonState();
}

class _SlidingAnimationButtonState extends State<SlidingAnimationButton>
    with TickerProviderStateMixin {
  late AnimationController _enabledController;
  late AnimationController _slideController;
  late AnimationController _disabledController;

  @override
  void initState() {
    _enabledController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _disabledController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
    if (widget.state == AnimatedButtonState.disabled) {
      _setDisabled(animate: false);
    }
  }

  @override
  void didUpdateWidget(covariant SlidingAnimationButton oldWidget) {
    if (oldWidget.state != widget.state) {
      switch (widget.state) {
        case AnimatedButtonState.enabled:
          _setEnabled();
          break;
        case AnimatedButtonState.disabled:
          _setDisabled();
          break;
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _setEnabled() {
    _disabledController.reverse().then((value) {
      return Future.delayed(Duration(milliseconds: 50), () {
        return _slideController.reverse().then((value) {
          return _enabledController.reverse();
        });
      });
    });
  }

  void _setDisabled({bool animate = true}) {
    if (animate) {
      _enabledController.forward().then((value) {
        return Future.delayed(Duration(milliseconds: 50), () {
          _slideController.forward().then((value) {
            return _disabledController.forward();
          });
        });
      });
    } else {
      _enabledController.animateTo(1, duration: Duration.zero);
      _slideController.animateTo(1, duration: Duration.zero);
      _disabledController.animateTo(1, duration: Duration.zero);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap:
            widget.state == AnimatedButtonState.enabled ? widget.onTap : null,
        splashColor: Theme.of(context).accentColor.withOpacity(0.3),
        highlightColor: Theme.of(context).accentColor.withOpacity(0.3),
        child: SizedBox(
          height: 56,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Ink(color: widget.disabled.background),
              _DisabledTextTransition(
                animation: CurvedAnimation(
                  parent: _disabledController,
                  curve: Curves.easeInSine,
                  reverseCurve: Curves.easeInSine,
                ),
                offset: -24,
                child: Text(
                  widget.disabled.text,
                  style: TextStyle(
                    color: widget.disabled.textColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              _BackgroundSlideTransition(
                animation: CurvedAnimation(
                  parent: _slideController,
                  curve: Curves.easeIn,
                  reverseCurve: Curves.easeIn,
                ),
                child: Ink(color: widget.enabled.background),
              ),
              _EnabledTextTransition(
                animation: CurvedAnimation(
                  parent: _enabledController,
                  curve: Curves.easeInSine,
                  reverseCurve: Curves.easeInSine,
                ),
                offset: 24,
                child: Text(
                  widget.enabled.text,
                  style: TextStyle(
                    color: widget.enabled.textColor ??
                        Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _enabledController.dispose();
    _disabledController.dispose();
    _slideController.dispose();
    super.dispose();
  }
}

class _DisabledTextTransition extends AnimatedWidget {
  final Widget child;
  final double offset;

  _DisabledTextTransition({
    Key? key,
    required Animation<double> animation,
    required this.child,
    required this.offset,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return ClipRect(
      child: Transform.translate(
        offset: Offset(0, (1 - animation.value) * offset),
        child: child,
      ),
    );
  }
}

class _BackgroundSlideTransition extends AnimatedWidget {
  final Widget child;

  const _BackgroundSlideTransition({
    Key? key,
    required this.child,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Transform.translate(
      child: child,
      offset: Offset(0, animation.value * 56),
    );
  }
}

class _EnabledTextTransition extends AnimatedWidget {
  final Widget child;
  final double offset;

  _EnabledTextTransition({
    Key? key,
    required Animation<double> animation,
    required this.child,
    required this.offset,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return ClipRect(
      child: Transform.translate(
        child: child,
        offset: Offset(0, animation.value * offset),
      ),
    );
  }
}
