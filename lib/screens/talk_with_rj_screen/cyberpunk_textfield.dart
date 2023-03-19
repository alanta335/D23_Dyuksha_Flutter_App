import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CyberpunkTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String label;
  final bool isActive;

  const CyberpunkTextField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.chakraPetch(
            color: Colors.yellow,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12.0),
        TextField(
          enabled: isActive,
          minLines: maxLines,
          maxLines: maxLines != 1 ? maxLines + 4 : 1,
          style: GoogleFonts.chakraPetch(
            color: Colors.yellow,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          cursorColor: Colors.yellow,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.yellow.withOpacity(0.3),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.yellow,
                width: 1,
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.yellow,
                width: 1,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
