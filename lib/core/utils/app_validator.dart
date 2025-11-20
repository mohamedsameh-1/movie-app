abstract class AppValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    // Min 8 chars + 1 uppercase + 1 lowercase + 1 number + 1 symbol
    final passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$!%*?&])[A-Za-z\d@#$!%*?&]{8,}$',
    );

    if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 8 characters, include uppercase, lowercase, number and special character';
    }

    return null;
  }

  static String? validateConfirmPassword(String? pass, String? confirm) {
    if (confirm == null || confirm.trim().isEmpty) {
      return 'Confirm Password is required';
    }

    if (pass != confirm) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    // Must start with +20 and followed by 10 or more digits
    final phoneRegExp = RegExp(r'^\+20\d{10}$');

    if (!phoneRegExp.hasMatch(value.trim())) {
      return 'Phone must start with +20 and contain 12 digits total (e.g. +201141209334)';
    }

    return null;
  }

  static String? validateRequired(
    String? value, [
    String message = 'This field is required',
  ]) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }
}
