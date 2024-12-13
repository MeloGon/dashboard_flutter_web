import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.red.withOpacity(.9),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }
}
