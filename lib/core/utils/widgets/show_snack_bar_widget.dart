import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar showSnackBarWidget({
  required String message,
  SnackBarMode mode = SnackBarMode.success,
  SnackBarBehavior behavior = SnackBarBehavior.floating
}) {
  return SnackBar(
    backgroundColor: _getSnackBarColor(mode),
    behavior: behavior,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    content: Text(message,style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: mode == SnackBarMode.warning ? const Color(0xFF1C1C1C) : const Color(0xFFFFFFFF)
    )
    ),
  );
}

  Color _getSnackBarColor(SnackBarMode mode) {
    switch(mode) {
      case SnackBarMode.success:
        return CupertinoColors.systemGreen;
      case SnackBarMode.error:
        return CupertinoColors.systemRed;
      case SnackBarMode.warning:
        return CupertinoColors.systemYellow;
    }
  }


  void showCustomSnackBar({ required BuildContext context,required SnackBar snackBar}) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

enum SnackBarMode {success,error,warning}
