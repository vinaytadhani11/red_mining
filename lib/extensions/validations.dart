class Validator {
  static bool isPasswordValid(String password) {
    // Check if the password length is at least 8 characters.
    if (password.length < 8) {
      return false;
    }

    // Check if the password contains at least one uppercase letter, one lowercase letter, and one digit.
    bool hasUppercase = false;
    bool hasLowercase = false;
    bool hasDigit = false;
    bool hasSpecialChar = false;

    for (int i = 0; i < password.length; i++) {
      if (password[i].contains(RegExp(r'[0-9]'))) {
        hasDigit = true;
      } else if (password[i].contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialChar = true;
      } else if (password[i].toUpperCase() == password[i]) {
        hasUppercase = true;
      } else if (password[i].toLowerCase() == password[i]) {
        hasLowercase = true;
      }
    }

    // Check if the password contains special characters (non-alphanumeric).
    // bool hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    // Return true if all conditions are met.
    return hasUppercase && hasLowercase && hasDigit && hasSpecialChar;
  }

  static bool isEmailValid(String email) {
    // Define a regular expression pattern for a valid email address.
    // This is a basic example; you can use a more comprehensive regex pattern if needed.
    final RegExp emailRegExp = RegExp(r"^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$");

    // Use the RegExp `hasMatch` method to check if the email matches the pattern.
    return emailRegExp.hasMatch(email);
  }

  static bool isNameValid(String password) {
    // Check if the password contains special characters (non-alphanumeric).
    bool hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    // Return true if all conditions are met.
    return !hasSpecialChar;
  }
}
