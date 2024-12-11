import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: buildBoxDecoration(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Image(
                image: AssetImage('twitter-white-logo.png'),
                width: 400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('twitter-bg.png'), fit: BoxFit.cover),
      );
}
