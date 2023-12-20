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
}
