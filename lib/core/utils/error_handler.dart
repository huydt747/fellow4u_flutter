import 'package:flutter/material.dart';
import '../exceptions/api_exception.dart';

class ErrorHandler {
  static void showError(BuildContext context, dynamic error) {
    String message = 'An unexpected error occurred';
    IconData icon = Icons.error_outline;
    Color color = Colors.red;

    if (error is NoConnectionException) {
      message = error.message;
      icon = Icons.wifi_off;
      color = Colors.orange;
    } else if (error is ServerException) {
      message = error.message;
      icon = Icons.dns;
    } else if (error is UnauthorizedException) {
      message = error.message;
      icon = Icons.lock_outline;
    } else if (error is ApiException) {
      message = error.message;
    } else if (error is Exception) {
      message = error.toString().replaceAll('Exception: ', '');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        action: error is NoConnectionException 
          ? SnackBarAction(
              label: 'RETRY', 
              textColor: Colors.white,
              onPressed: () {
                // You could implement a global retry mechanism here if needed
              },
            )
          : null,
      ),
    );
  }
}
