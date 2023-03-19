import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CyberpunkButton extends StatefulWidget {
  final Color color;
  final VoidCallback onTap;
  final String label;
  final bool isPressed;
  const CyberpunkButton({
    required this.color,
    required this.label,
    required this.onTap,
    this.isPressed = false,
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(height: 70.0, width: 140.0),
          ClipPath(
            clipper: ButtonClipper(),
            child: Container(
              color: widget.color,
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 26.0,
              ),
              child: Text(
                widget.label.toUpperCase(),
                style: GoogleFonts.chakraPetch(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          if (!_isPressed && widget.isPressed)
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
                right: 8.0,
              ),
              child: ClipPath(
                clipper: ButtonClipper(),
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 26.0,
                  ),
                  child: Text(
                    widget.label.toUpperCase(),
                    style: GoogleFonts.chakraPetch(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: widget.color,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(16, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height / 4)
      ..lineTo(size.width - 5.0, size.height / 4 + 5.0)
      ..lineTo(size.width - 5.0, size.height * 3 / 4 - 5.0)
      ..lineTo(size.width, size.height * 3 / 4)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, 16.0)
      ..close();
  }

  @override
  bool shouldReclip(ButtonClipper oldClipper) {
    return false;
  }
}
