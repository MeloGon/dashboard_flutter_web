import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;
  const CustomIconButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = Colors.indigo,
      this.isFilled = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(const StadiumBorder()),
          backgroundColor: WidgetStateProperty.all(
            color.withOpacity(
              .5,
            ),
          ),
          overlayColor: WidgetStateProperty.all(
            color.withOpacity(
              .3,
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
