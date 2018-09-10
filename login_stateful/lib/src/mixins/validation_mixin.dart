class ValidationMixin {
  String validateEmail (value) {
    if (!value.contains('.') || !value.contains('@')) {
      return 'Not a valid email.';
    }
    return null;
  }

  String validatePassword (String input) {
    List<String> errorMessage = [];
    if (input.length < 7) {
      errorMessage.add('Must be at least 7 CHARACTERS.');
    }
    if (!input.contains(new RegExp(r'[0-9]'))) {
      errorMessage.add('Must contain a NUMBER.');
    }
    if (errorMessage.length != 0) {
      return errorMessage.join(' ');
    }
  }
}