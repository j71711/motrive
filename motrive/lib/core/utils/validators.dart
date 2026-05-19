// validators.dart
class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-s./0-9]*$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < minLength) {
      return 'Must be at least $minLength characters';
    }
    return null;
  }

  static String? validateOdometer(
    String? value,
    int odometer, {
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    } else if ((int.tryParse(value) ?? 0) < odometer) {
      return '${fieldName ?? 'This odometer'} is less than the current';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 2) {
      return 'Must be at least 2 characters';
    }
    final trimmed = value.trim();

    final parts = trimmed.split(RegExp(r'\s+'));

    if (parts.length >= 2 &&
        parts.length <= 4 &&
        parts.every(
          (part) => RegExp(r'^[a-zA-Z\u0600-\u06FF]+$').hasMatch(part),
        )) {
      return null;
    }

    return 'Name is invalid';
  }
}
