import 'dart:async';

class ValidatorMixins {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@') && email.contains('.')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      String errorMessage = '';
      if (password.length < 7) {
        errorMessage += 'Must be 7 Characters. ';
      }
      if (!password.contains(new RegExp(r"[0-9]"))) {
        errorMessage += 'Must contain a number. ';
      }
      if (errorMessage.length == 0) {
        sink.add(password);
      } else {
        sink.addError(errorMessage);
      }
    }
  );
}