import 'package:flutter/material.dart';

class Utils {
  static const String httpwww = 'https://www.';
  static const String httpwwwTwo = 'http:www.';
  static const String http = 'https://';
  static const String endSlash = '/';

  String? usernameValidator(String val) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    }

    return null;
  }

  String clearUrl(String siteName) {
    if (siteName.contains(httpwww) ||
        siteName.contains(endSlash) ||
        siteName.contains(httpwwwTwo)) {
      siteName = siteName.replaceAll(httpwww, '');
      siteName = siteName.replaceAll(http, '');
      siteName = siteName.replaceAll(endSlash, '');
      siteName = siteName.replaceAll(httpwwwTwo, '');
    }
    return siteName;
  }

  String? emailValidator(String val) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{1,}$').hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String val) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    } else if (val.length < 8) {
      return 'Your password is less than 8 characters long';
    }
    return null;
  }

  String? confirmPasswordValidator(String val, String mainPassword) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    } else if (val != mainPassword) {
      return 'The password does not match';
    }
    return null;
  }

  String? addCoinValidator(String val) {
    if (!RegExp(r'^[0-9]').hasMatch(val)) {
      return 'Please enter only the number of coins you need';
    }
    return null;
  }

  void errorSnackBar(BuildContext context, ThemeData theme, String? errorMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: theme.cardColor,
        content: Center(
          child: Text(
            errorMsg ?? 'Unknown error',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
