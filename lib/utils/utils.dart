class CustomFieldValidator {
  String? usernameValidator(String val) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    }

    return null;
  }

  String? emailValidator(String val) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String val) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    }
    // else if (!RegExp(
    //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
    //     .hasMatch(val)) {
    //   return 'Please enter a valid password';
    // }
    else if (val.length < 8) {
      return 'Your password is less than 8 characters long';
    }
    return null;
  }

  String? confirmPasswordValidator(String val, String mainPassword) {
    if (val.isEmpty) {
      return 'Please fill in this field';
    }
    // else if (!RegExp(
    //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
    //     .hasMatch(val)) {
    //   return 'Please enter a valid password';
    // }
    // else if (val.length < 8) {
    //   return 'Your password is less than 8 characters long';
    // }
    else if (val != mainPassword) {
      return 'The password does not match';
    }
    return null;
  }
}
