class Utils {
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
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
        .hasMatch(val)) {
      return 'Please enter a valid password';
    } else if (val.length < 8) {
      return 'Your password is less than 8 characters long';
    }
    return null;
  }
}
