import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatefulWidget {
  final String text;
  final Function? onPressed;

  const LinkText({super.key, required this.text, this.onPressed});

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) widget.onPressed!();
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) {
          setState(() {});
          isHover = true;
        },
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: GoogleFonts.montserratAlternates(
                color: Colors.grey[700],
                decoration:
                    isHover ? TextDecoration.underline : TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
