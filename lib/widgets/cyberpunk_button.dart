import 'package:flutter/material.dart';

class CyberpunkButton extends StatefulWidget {
  final Widget relaxed;
  final Widget pressed;
  final VoidCallback onTap;
  const CyberpunkButton({
    required this.relaxed,
    required this.pressed,
    required this.onTap,
    super.key,
  });

  @override
  State<CyberpunkButton> createState() => _CyberpunkButtonState();
}

class _CyberpunkButtonState extends State<CyberpunkButton> {
  bool _isPressed = false;

  void _onTap() {
    setState(() {
      _isPressed = !_isPressed;
    });
    widget.onTap();
    Future.delayed(const Duration(milliseconds: 160), () {
      setState(() {
        _isPressed = !_isPressed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 50),
        child: _isPressed ? widget.pressed : widget.relaxed,
      ),
    );
  }
}
