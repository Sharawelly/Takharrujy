class Validators {
  // Full Name Validation (T49, T50, T51)
  static String? validateFullName(String? value) {
    // if (value == null || value.trim().isEmpty) {
    //   return 'Full Name must not be blank';
    // }

    // if (value.trim().length < 2) {
    //   return 'Full Name must be at least 2 characters';
    // }

    // // Check for special characters (T50)
    // if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    //   return 'Special characters are not allowed in name';
    // }

    // // Check if first character is space (T51)
    // if (value.startsWith(' ')) {
    //   return 'First character of name must not be a space';
    // }

    return null;
  }

  // Email Validation (T17, T20, T52, T53, T56)
  static String? validateEmail(String? value) {
    // if (value == null || value.trim().isEmpty) {
    //   return 'Email must not be blank';
    // }

    // // Basic email format validation (T17)
    // final emailRegex = RegExp(
    //   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    // );
    // if (!emailRegex.hasMatch(value)) {
    //   return 'Please enter a valid email address';
    // }

    // // University domain validation (T56)
    // final universityDomainRegex = RegExp(r'@.*\.(edu|ac\.\w+)$');
    // if (!universityDomainRegex.hasMatch(value)) {
    //   return 'Only university domain emails are allowed (e.g. @student.uni.edu)';
    // }

    return null;
  }

  // Password Validation (T18, T19, T25, T30, T31, T32, T55, T60)
  static String? validatePassword(String? value) {
    // if (value == null || value.isEmpty) {
    //   return 'Password must not be blank';
    // }

    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters';
    // }

    // // Check for spaces (T55)
    // if (value.contains(' ')) {
    //   return 'Password must not contain spaces';
    // }

    // // Check for at least one number (T30)
    // if (!RegExp(r'[0-9]').hasMatch(value)) {
    //   return 'Password must contain at least one number';
    // }

    // // Check for at least one special character (T31)
    // if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    //   return 'Password must contain at least one special character';
    // }

    return null;
  }

  // Confirm Password Validation (T28, T29, T54)
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password must not be blank';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // Project Title Validation (T1, T33, T34)
  static String? validateProjectTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Project title must not be blank';
    }

    // Check for special characters (T33)
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Special characters are not allowed in Project Title';
    }

    // Check for numeric digits (T34)
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Project Title must not contain numeric digits';
    }

    return null;
  }

  // Team Name Validation (T35, T36, T37)
  static String? validateTeamName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Team Name must not be blank';
    }

    // Check for special characters (T36)
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Special characters are not allowed in Team Name';
    }

    return null;
  }

  // Task Title Validation (T38, T40)
  static String? validateTaskTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Task Title must not be blank';
    }

    // Check for special characters (T40)
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Special characters are not allowed in Task Title';
    }

    return null;
  }

  // Task Description Validation (T41)
  static String? validateTaskDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Task Description must not be blank';
    }

    return null;
  }

  // AI Prompt Validation (T44, T45)
  static String? validateAIPrompt(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'AI prompt must not be blank';
    }

    // Check for special characters (T44)
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Special characters are not allowed in prompt';
    }

    // Check character limit (T45)
    if (value.length > 500) {
      return 'Prompt must not exceed 500 characters';
    }

    return null;
  }

  // Feedback Comment Validation (T46, T47, T48)
  static String? validateFeedbackComment(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Feedback comment must not be blank';
    }

    if (value.trim().length < 10) {
      return 'Feedback must be at least 10 characters';
    }

    // Check for special characters (T47)
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Special characters are not allowed in comment';
    }

    return null;
  }

  // Message Validation (T63, T64, T65, T66)
  static String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Message field must not be blank';
    }

    if (value.length > 1000) {
      return 'Message must not exceed 1000 characters';
    }

    // Check if first character is space (T65)
    if (value.startsWith(' ')) {
      return 'First character must not be a space';
    }

    return null;
  }

  // Message Subject Validation (T66)
  static String? validateMessageSubject(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Message subject must not be blank';
    }

    // Check for special characters (T66)
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'No special characters allowed in message subject';
    }

    return null;
  }

  // Generic required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName must not be blank';
    }
    return null;
  }

  // Generic length validation
  static String? validateLength(
    String? value,
    int minLength,
    int maxLength,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName must not be blank';
    }

    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }

    if (value.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }

    return null;
  }
}
