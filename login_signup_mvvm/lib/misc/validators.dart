String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name Required!';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email Address Required!';
  } else if (!RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value)) {
    return 'invalid email address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password Required!';
  } else if (!RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})')
      .hasMatch(value)) {
    return 'password must have at least 8 characters or more with one uppercase, one lowercase and one digit with at least one special character.';
  }
  return null;
}

String? validateConfirmPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please Retype Password';
  }
  return null;
}
